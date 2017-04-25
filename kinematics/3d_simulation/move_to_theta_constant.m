function [] = move_to_theta_constant(theta_a, theta_b, n0, n1, n2, nf, is_plot_graph)
    
    %We have 3 separate equations
    %The first equation is for the motion from rest to the constant 
    %Velocity.  
    
    %The second equation is for the continuous motion with constant
    %Velocity. Having a single constraint, a linear equation is used.
    
    %The third equation is for the motion from constant velocity to 
    %rest. Having four constraint equations, a cubic equation is used.
 
    %First we compute parameters the general cubic equation
    %From start to finish
    %This is required to fulfill the constraints for the other
    %piecewise models
    
    A0 = [n0^3 n0^2 n0 1; 3*(n0^2) 2*n0 1 0; nf^3 nf^2 nf 1; 3*(nf^2) 2*nf 1 0];
    
    % joint variable matrix
    B0 = [theta_a(1:4); [0 0 0 0]; theta_b(1:4); [0 0 0 0]]; %Initial and final velocities are zero
    
    x0 = A0\B0; %(inv(A0)*B0)
    
    disp('B0:');
    disp(B0);
    
    disp('x0:');
    disp(x0);
    
    disp('----------------');
    disp('A0*x0:');
    disp(A0*x0);
    disp('----------------');
    
    %Calculating the joint positions at n1 and n2 to fulfill conditions
    %for the piecewise equations
    
    tmp_q1 = [n1^3 n1^2 n1 1]*x0;
    tmp_q2 = [n2^3 n2^2 n2 1]*x0;
    
    %Calculating the velocity that makes such a motion possible
    %If an arbitrary velocity is given, the linear motion(constant velocity
    %motion) might go in an undesirable direction
    %Velocity for each joint is computed such that the net desired
    %Motion is obtained
    dqc = (tmp_q1-tmp_q2)/(n1-n2);
    
    disp('velocity');
    disp(dqc);
    
    
    %Cubic equation for the motion from rest to constant velocity
    
    %Iteration variable matrix
    A1 = [n0^3 n0^2 n0 1; 3*(n0^2) 2*n0 1 0; n1^3 n1^2 n1 1; 3*(n1^2) 2*n1 1 0];
    
    %Joint variable matrix
    B1 = [theta_a(1:4); [0 0 0 0]; tmp_q1; dqc];
    
    %Equation parameters
    x1 = A1\B1; %inv(A1)*B1
    
    disp('B1:');
    disp(B1);
    
    disp('x1:');
    disp(x1);
    
    disp('----------------');
    disp('A1*x1:');
    disp(A1*x1);
    disp('----------------');
    
    %Now we calculate parameters for the linear equation
    %The equation is of the form q(n) = dqc*n + c1
    %Where c1 can be computed from boundary conditions
    %c1 = a*n1*n1 + b*n1 + c - dqc*n1
    
    %First we calculate c1
    
    c1 = [n1^3 n1^2 n1 1]*x1;
    c1 = c1 - (dqc*n1);
    
    %Parameters of the linear equations are dqc and c1
    x2 = [dqc; c1];
    

    
    
    %Now we compute the parameters of the cubic equation for motion to rest
    A3 = [nf^3 nf^2 nf 1; 3*(nf^2) 2*nf 1 0; n2^3 n2^2 n2 1; 3*(n2^2) 2*n2 1 0];
   
    
    B3 = [theta_b(1:4); [0 0 0 0]; tmp_q2; dqc];
    
    %Compute parameters
    x3 = A3\B3;
    
    disp('B3:');
    disp(B3);
    
    disp('x3:');
    disp(x3);
    
    disp('----------------');
    disp('A3*x3:');
    disp(A3*x3);
    disp('----------------');
    
    %The arm is moved in 3 phases
    
    %First the rest to constant velocity phase
    for i=n0:n1
        
        a = [i^3 i^2 i 1];
        theta_c = a*x1;
        theta_c = [theta_c 0];
        fk_coord_plot(theta_c);
        pause(0.001);
    end
    
    %Next the constant velocity phase
    for i=n1:n2
        
        a = [i 1];
        theta_c = a*x2;
        theta_c = [theta_c 0];
        fk_coord_plot(theta_c);
        pause(0.001);
    end
   
    %Next the constant velocity to rest phase
    for i=n2:nf
        
        a = [i^3 i^2 i 1];
        theta_c = a*x3;
        theta_c = [theta_c 0];
        fk_coord_plot(theta_c);
        pause(0.001);
    end
    
    
     %Plotting the graphs if selected in the UI
    if(is_plot_graph)
        
        
        time_axis = n0:nf;
        angle_axis = [];
        velocity_axis = [];
        
        for i=n0:n1
            
            a = [i^3 i^2 i 1]; %For angle
            b = [3*(i^2) 2*i 1 0]; %For velocity
            theta_c = a*x1;
            angle_axis = [angle_axis; theta_c];
            theta_c = b*x1;
            velocity_axis = [velocity_axis; theta_c];
        end
        
        for i=n1+1:n2
            
            a = [i 1]; %For angle
            b = [1 0]; %For velocity
            theta_c = a*x2;
            angle_axis = [angle_axis; theta_c];
            theta_c = b*x2;
            velocity_axis = [velocity_axis; theta_c];
        end
        
        for i=n2+1:nf
            
            a = [i^3 i^2 i 1]; %For angle
            b = [3*(i^2) 2*i 1 0]; %For velocity
            theta_c = a*x3;
            angle_axis = [angle_axis; theta_c];
            theta_c = b*x3;
            velocity_axis = [velocity_axis; theta_c];
        end
        
        %Plotting angles
        
        figure('Name', 'Angle Plot');
        title('Angle Plot');
        xlabel('Iteration');
        ylabel('Angle (rad)');
        hold on;
        
        
        %Plotting angle plot for all the joints
        plot(time_axis, angle_axis(:, 1));
        plot(time_axis, angle_axis(:, 2));
        plot(time_axis, angle_axis(:, 3));
        plot(time_axis, angle_axis(:, 4));
        
        legend('Joint 1', 'Joint 2', 'Joint 3', 'Joint 4');
        
        hold off;
        
        %Plotting velocities
        
        figure('Name', 'Velocity Plot');
        title('Velocity Plot');
        xlabel('Iteration');
        ylabel('Velocity (rad/iter)');
        hold on;
        
        
        %Plotting velocity plot for all the joints
        plot(time_axis, velocity_axis(:, 1));
        plot(time_axis, velocity_axis(:, 2));
        plot(time_axis, velocity_axis(:, 3));
        plot(time_axis, velocity_axis(:, 4));
        
        legend('Joint 1', 'Joint 2', 'Joint 3', 'Joint 4');
        
        hold off;
        
    end
    
    

  
end