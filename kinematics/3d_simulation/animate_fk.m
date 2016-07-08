clc;

initial_theta = [0 pi/2 pi/2 0 0];
%sample angles
% -1.5707 1.5707 1.5707 0 0
% -0.756 0.984 0 -1.324 1.23
theta_a = initial_theta;
figure;
fk_coord_plot(initial_theta);
initialize_axes();

while(true)
    
    in = input('Enter the list of space separated theta values.\nEnter "q" to quit.\n', 's');
    if in=='q'
        break;
    
    else
        theta_b = str2double(strsplit(in));
        %Animating the rotation. rounding off to avoid errors
        theta_b = round(theta_b, 2);
        theta_a = round(theta_a, 2);
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
        
        theta_a = theta_b;
                    
        
    end
end

    
    