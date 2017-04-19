function [] = move_to_target_linear(target_a, target_b, n0, nf, is_plot_trajectory)
    
    %First check if both the solutions are valid
    t_a = ik_pseudo_inverse(target_a');
    t_b = ik_pseudo_inverse(target_b');
    
    
    % In this case, we assume that if the end points are valid then 
    % all linear points between them can be reached
    
    if(t_a~=-1 & t_b~=-1)
        
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
        
        %Plot initial target position
        fk_coord_plot(t_a);
        
        for i=n0:nf
            
            a = [i 1];
            target_c = a*x;
            
            if(is_plot_trajectory)
                
                for j=n0:nf
                    
                    aa = [j 1];
                    target_cc = aa*x;
                    %Plot trajectory
                    [xc, yc, zc] = map_coord(target_cc);
                    hold on;
                    plot3(xc, yc, zc, '.', 'Color', 'c', 'MarkerSize', 10);
                end
                
                
            end
            
            t_c = ik_pseudo_inverse_initial(target_c', t_a');
            
            fk_coord_plot(t_c);
            
            pause(0.001);
            
            t_a = t_c;
        end
        
   
        
    end
    
    
    
    
    
    
    
    
end