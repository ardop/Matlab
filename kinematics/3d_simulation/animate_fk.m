clc;

initial_theta = [0, pi/2, pi/2, 0, 0];
% -1.5707 1.5707 1.5707 0 0

figure;
fk_coord_plot(initial_theta);
initialize_axes();

while(true)
    
    in = input('Enter the list of space separated theta values.\nEnter "q" to quit.\n', 's');
    if in=='q'
        break;
    
    else
        theta_b = str2double(strsplit(in));
        %Animating the rotation
        theta_b = round(theta_b, 2);
        theta_a = round(initial_theta, 2);
        done = false;
        
        while ~done
            theta_check = theta_a - theta_b;
            for i=1:5
                if theta_check(i)<0
                    theta_a(i) = theta_a(i) + 0.01;
                elseif theta_check(i)>0
                    theta_a(i) = theta_a(i) - 0.01;
                end
            end
                
            %Plotting
            fk_coord_plot(theta_a);
            pause(0.01);

            
            %Checking equality
            if sum(theta_a - theta_b)<0.001
                done = true;
            end
            disp(sum(theta_a-theta_b));

        end
        
        theta_a = theta_b;
                    
        
    end
end

    
    