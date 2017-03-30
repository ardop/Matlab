function [theta_a] = move_to_target(target, theta_a)

    theta_b = ik_pseudo_inverse_initial(target', theta_a);
    theta_b = theta_b';

    if theta_b~=-1

        done = false;

        while ~done
            theta_check = theta_a - theta_b;
            %Rounding off to avoid errors
            theta_a = round(theta_a, 2);
            theta_b = round(theta_b, 2);
            for i=1:5
                %Updating angle at every time instance
                if theta_check(i)<0
                    theta_a(i) = theta_a(i) + 0.01;
                elseif theta_check(i)>0
                    theta_a(i) = theta_a(i) - 0.01;
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

        end

    else

        fprintf('No Solution\n\n');

    end
    
    theta_a = theta_b;