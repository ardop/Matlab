function [theta_b] = move_to_target_linear(theta_a, target_a, target_b, n0, nf, is_plot_trajectory)
    
%     t_a = ik_pseudo_inverse(target_a');
    t_a = theta_a';
    t_b = ik_pseudo_inverse(target_b');
    
    theta_b = 0;
    
    % In this case, we assume that if the end points are valid then 
    % all linear points between them can be reached
    
    if(t_b~=-1)
        
        %Creating a linear equation with two unknowns to satisfy
        %the two end point position constraints for x, y and z
        
        A = [n0 1; nf 1];
        B = [target_a; target_b];
        
        %Finding equation parameters
        x = A\B;
        
        disp('B:');
        disp(B);
        disp('X');
        disp(x);
        disp('----------------');
        disp('A*x:');
        disp(A*x);
        disp('----------------');
        
        disp('COMPUTING TRAJECTORY:');
        fprintf('\n');
        
        trajectory_configurations = [];
        
        for i=n0:nf
            
            a = [i 1];
            target_c = a*x;
             
            t_c = ik_pseudo_inverse_initial(target_c', t_a');
            trajectory_configurations = [trajectory_configurations; t_c'];
            fprintf('Iteration: %d\n', i);
            theta_b = t_c';

            t_a = t_c;
    
        end
        
        %Plotting the stored trajectory
        fprintf('PLOTTING TRAJECTORY:\n');
        
        for i=1:length(trajectory_configurations);
            
            fk_coord_plot(trajectory_configurations(i, :));
            pause(0.001);
            
        end
       
        
        %Plot trajectory
        if(is_plot_trajectory)
                
            for i=1:length(trajectory_configurations)

                target_c = get_coord(fkval(trajectory_configurations(i, :)));
                [xc, yc, zc] = map_coord(target_c);
                plot3(xc, yc, zc, '.', 'Color', 'c', 'MarkerSize', 7);
                hold on;
                
            end

        end
        
    end    
    
end