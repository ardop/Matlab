function [] = move_to_theta_cubic(theta_a, theta_b, n0, nf, dq0, dqf, is_plot_graph)
    
    
    %We first calculate the cubic equations for all 4 joint variables
    % An equation has the parameters a, b, c, d which form coefficients
    % of the cubic equation for that particular joint variable.
    % The equation taken here is an3 + bn2 + cn + d
    
    % iteration variable matrix
    A = [n0^3 n0^2 n0 1; 3*(n0^2) 2*n0 1 0; nf^3 nf^2 nf 1; 3*(nf^2) 2*nf 1 0];
    
    % joint variable matrix
    B = [theta_a(1:4); [dq0 dq0 dq0 dq0]; theta_b(1:4); [dqf dqf dqf dqf]];
    
%     disp('B:');
%     disp(B);
%     
%     disp('x:');
    x = A\B; %(inv(A)*B)
%     
%     disp(x);
%     disp('----------------');
%     disp('A*x:');
%     disp(A*x);
%     disp('----------------');
    
    %Now that we have each of the cubic equations, the arm is moved
    
    for i=n0:nf
        
        %For this particular iteration instant, we calculate
        %all joint variable values
        
        a = [i^3 i^2 i 1];
        theta_c = a*x;
        theta_c = [theta_c 0];
        fk_coord_plot(theta_c);
        pause(0.01);
    end
    
    %Plotting the graphs if selected in the UI
    if(is_plot_graph)
        
        
        time_axis = n0:nf;
        angle_axis = [];
        velocity_axis = [];
        
        for i=n0:nf
            
            a = [i^3 i^2 i 1]; %For angle
            b = [3*(i^2) 2*i 1 0]; %For velocity
            theta_c = a*x;
            angle_axis = [angle_axis; theta_c];
            theta_c = b*x;
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