function [] = move_to_theta_uniform(theta_a, theta_b)
    
    done = false;
    
    %We calculate the the difference between initial and final positions
    %(theta). We then find the max such difference among the 5 differences
    %and make sure that all the angles update uniformly and converge at the
    %same iteration
    
    theta_diff = abs(theta_b - theta_a);
    max_diff = max(theta_diff);
    min_diff = min(theta_diff);
    min_iter = min_diff/0.01;
    
    
    
    while ~done
            theta_check = theta_a - theta_b;
            %Rounding off to avoid errors
            theta_a = round(theta_a, 2);
            theta_b = round(theta_b, 2);
            flag = 0;
            for i=1:5
                %Updating angle at every time instance
                if theta_check(i)<0
                    theta_a(i) = theta_a(i) + 0.01;
                elseif theta_check(i)>0
                    theta_a(i) = theta_a(i) - 0.01;
                else
                    flag = flag + 1;
                end
            end

            %Plotting
            fk_coord_plot(theta_a);
            %Pause required for animation
            pause(0.01);

            %Checking equality using threshold to avoid
            %Matlab equality errors
            if sum(abs(theta_a - theta_b))<0.001
                done = true;
            end
            
            if flag==5
                done = true;
            end

    end
end