function [theta_b] = move_to_target_linear_quintic(theta_a, target_a, target_b, n0, nf, dt0, dtf, ddt0, ddtf, is_plot_trajectory, is_plot_graph)
    

%     t_a = ik_pseudo_inverse(target_a');
    t_a = theta_a';
    t_b = ik_pseudo_inverse(target_b');
    
    theta_b = 0;
    
    % In this case, we assume that if the end points are valid then 
    % all linear points between them can be reached
    
    %For control over the velocity and the accelerations, we use a 
    %quintic equation for x, y and z
    
    if(t_b~=-1)
        
        %First we create a quintic equation for x, with the end position, 
        %end velocity and end accelerations
        
        Ax = [n0^5 n0^4 n0^3 n0^2 n0 1;...
            5*(n0^4) 4*(n0^3) 3*(n0^2) 2*n0 1 0;...
            20*(n0^3) 12*(n0^2) 6*n0 2 0 0;...
            nf^5 nf^4 nf^3 nf^2 nf 1;...
            5*(nf^4) 4*(nf^3) 3*(nf^2) 2*nf 1 0;...
            20*(nf^3) 12*(nf^2) 6*nf 2 0 0];
        
        Bx = [target_a(1); dt0; ddt0; target_b(1); dtf; ddtf];
        
        %Finding equation parameters for the X coordinate
        x = Ax\Bx;
        
        disp('Bx:');
        disp(Bx);
        disp('X');
        disp(x);
        disp('----------------');
        disp('Ax*x:');
        disp(Ax*x);
        disp('----------------');
        
        %Finding parameters for the Y coordinate
        %As the motion is a straight line motion, we use straight line
        %slopes to compute y and z trajectories
        
        my = (target_b(2)-target_a(2))/(target_b(1)-target_a(1)); %slope
        
        mz = (target_b(3)-target_a(3))/(target_b(1)-target_a(1)); %slope        
        
        disp('COMPUTING TRAJECTORY:');
        fprintf('\n');
        
        trajectory_configurations = [];
        
        target_axis = [];
        velocity_axis = [];
        acceleration_axis = [];
        
        for i=n0:nf
            
            a = [i^5 i^4 i^3 i^2 i 1];
            b = [5*(i^4) 4*(i^3) 3*(i^2) 2*i 1 0];
            c = [20*(i^3) 12*(i^2) 6*i 2 0 0];
            
            xc = a*x;
            yc = target_a(2) + my*(xc - target_a(1));
            zc = target_a(3) + mz*(xc - target_a(1));
            
            target_c = [xc yc zc];
            
            target_axis = [target_axis; [xc yc zc]];
            
            xc = b*x;
            yc = target_a(2) + my*(xc - target_a(1));
            zc = target_a(3) + mz*(xc - target_a(1));
            
            velocity_axis = [velocity_axis; [xc yc zc]];
            
            xc = c*x;
            yc = target_a(2) + my*(xc - target_a(1));
            zc = target_a(3) + mz*(xc - target_a(1));
            
            acceleration_axis = [acceleration_axis; [xc yc zc]];
             
            [xc, yc, zc] = map_coord(target_c);              
             
            t_c = ik_pseudo_inverse_initial(target_c', t_a');
            trajectory_configurations = [trajectory_configurations; t_c'];
            fprintf('Iteration: %d\n', i);
            theta_b = t_c';
            
            t_a = t_c;
    
        end
        
        %Plotting the stored trajectory
        fprintf('PLOTTING JOINT TRAJECTORY:\n');
        
        for i=1:length(trajectory_configurations);
            
            fk_coord_plot(trajectory_configurations(i, :));
            pause(0.001);
            
        end
       
        
        %Plot trajectory
        fprintf('PLOTTING END EFFECTOR TRAJECTORY:\n');
        if(is_plot_trajectory)
                
            for i=1:length(trajectory_configurations)

                target_c = get_coord(fkval(trajectory_configurations(i, :)));
                [xc, yc, zc] = map_coord(target_c);
                plot3(xc, yc, zc, '.', 'Color', 'c', 'MarkerSize', 7);
                
                
            end

        end
        
         %Plotting the graphs if selected in the UI
    if(is_plot_graph)
        
        
        time_axis = n0:nf;
        
        %Plotting angles
        
        figure('Name', 'Target Plot');
        title('Target Plot');
        xlabel('Iteration');
        ylabel('Target (cm)');
        hold on;
        
        
        %Plotting angle plot for all the joints
        plot(time_axis, target_axis(:, 1));
        plot(time_axis, target_axis(:, 2));
        plot(time_axis, target_axis(:, 3));
        
        legend('X coordinate', 'Y coordinate', 'Z coordinate');
        
        hold off;
        
        %Plotting velocities
        
        figure('Name', 'Target Velocity Plot');
        title('Target Velocity Plot');
        xlabel('Iteration');
        ylabel('Target Velocity (cm/iter)');
        hold on;
        
        
        %Plotting velocity plot for all the joints
        plot(time_axis, velocity_axis(:, 1));
        plot(time_axis, velocity_axis(:, 2));
        plot(time_axis, velocity_axis(:, 3));
        
        legend('X velocity', 'Y velocity', 'Z velocity');
        
        hold off;
        
        %Plotting accelerations
        
        
        figure('Name', 'Target Acceleration Plot');
        title('Target Acceleration Plot');
        xlabel('Iteration');
        ylabel('Target Acceleration (cm/iter^2)');
        hold on;
        
        
        %Plotting velocity plot for all the joints
        plot(time_axis, acceleration_axis(:, 1));
        plot(time_axis, acceleration_axis(:, 2));
        plot(time_axis, acceleration_axis(:, 3));
        
        legend('X acceleration', 'Y acceleration', 'Z acceleration');
        
        hold off;
        
    
    end
        
    end    
    
end