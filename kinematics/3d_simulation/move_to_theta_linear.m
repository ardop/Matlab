function [] = move_to_theta_linear(theta_a, theta_b, n0, nf, is_plot_graph)
    
    
    %We use linear equations as the only constraints are the end position
    %constraints
    
    % iteration variable matrix
    A = [n0 1; nf 1];
    
    % joint variable matrix
    B = [theta_a(1:4); theta_b(1:4)];
    
    disp('B:');
    disp(B);
    
    disp('x:');
    x = A\B; %(inv(A)*B)
    
    disp(x);
    disp('----------------');
    disp('A*x:');
    disp(A*x);
    disp('----------------');
    
    %Now that we have each of the cubic equations, the arm is moved
    
    for i=n0:nf
        
        %For this particular iteration instant, we calculate
        %all joint variable values
        
        a = [i 1];
        theta_c = a*x;
        theta_c = [theta_c 0];
        fk_coord_plot(theta_c);
        pause(0.01);
    end
    
    %Plotting the graphs if selected in the UI
    if(is_plot_graph)
        
        figure('Name', 'Angle Plot');
        title('Angle Plot');
        xlabel('Iteration');
        ylabel('Angle (rad)');
        hold on;
        
        time_axis = n0:nf;
        angle_axis = [];
        
        for i=n0:nf
            
            a = [i 1];
            theta_c = a*x;
            angle_axis = [angle_axis; theta_c];
        end
        
        
        %Plotting angle plot for all the joints
        plot(time_axis, angle_axis(:, 1));
        plot(time_axis, angle_axis(:, 2));
        plot(time_axis, angle_axis(:, 3));
        plot(time_axis, angle_axis(:, 4));
        
        legend('Joint 1', 'Joint 2', 'Joint 3', 'Joint 4');
        
        hold off;
        
    end
        
        
            
        
        
        
        
        
        
        
        
        
        


end