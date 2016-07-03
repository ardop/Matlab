clc;

initial_theta = [0, pi/2, pi/2, 0, 0];
% -1.5707 1.5707 1.5707 0 0
theta_a = round(initial_theta, 1);
figure;
fk_coord_plot(initial_theta);
initialize_axes();

while(true)
    
    in = input('Enter the list of space separated theta values.\nEnter "q" to quit.\n', 's');
    if in=='q'
        break;
    
    else
        theta_b = str2double(strsplit(in));
        theta_max = max(theta);
        %Animating the rotation
        theta = round(theta, 1);
        done = false;
        
        while ~done
            theta_check = theta_a - theta_b;
            for i=1:5
                if theta_check(i)<0
                    theta_a(i) = theta_a(i) + 0.1;
                else
                    theta_a(i) = theta_a(i) - 0.1;
                end
            end
                
            %Plotting
            hold off;
            fk_coord_plot(theta_a);
            initialize_axes();
            
            %Checking equality
            if sum(theta_a - theta_b)==0
                done = true;
                disp('haha\n');
            end
        end
        
        theta_a = theta_b;
                    
        
    end
end

    
    