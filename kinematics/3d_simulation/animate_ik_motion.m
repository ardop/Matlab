clc;

initial_theta = [0 pi/2 pi/2 0 0];
theta_a = initial_theta;
figure;
fk_coord_plot(initial_theta);
initialize_axes();

pxa = -35;
pxb = 10;
pya = 10;
pyb = 43;
pza = 0;
pzb = 25;


while(true)
    
    
    in = input('Enter the coordinate values.\n1: Target Control:\n    1: Linear\n2: Joint Control:\n    1: Linear\n    2: Cubic\n    3: Rest to rest with constant velocity\nEnter q to quit.\n', 's');
    if in=='q'
        break
        
    else
        in = strsplit(in);
        s = str2double(in);
        target1 = s(1:3);
        control_mode = s(4);
        motion_mode = s(5);
        
        theta_b = ik_pseudo_inverse(target1');
        theta_b = theta_b'; %Make it a row vector
        
        if(control_mode==1)
            %Target control
        
            
            
        elseif(control_mode==2)
            
            % Joint control
            
            if(motion_mode==1)

                %Linear uniform motion of joint angles.
                %First the joint angles for the second coordinate is calculated  
                move_to_theta_uniform(theta_a, theta_b);


            elseif(motion_mode==2)
                

                n0 = 0;
                nf = 100;
                %Initial and final velocities
                % Not absolute velocities. Iteration velocities
                dq0 = 0; 
                dqf = 0;

                move_to_theta_cubic(theta_a, theta_b, n0, nf, dq0, dqf);
                
            elseif(motion_mode==3)
                
                %Rest to rest with constant velocity
                
                n0 = 0;
                nf = 100;
                n1 = 5;
                n2 = 95;
                dqc = 0.001;
                
                move_to_theta_constant(theta_a, theta_b, n0, n1, n2, nf, dqc);
                

            end

            %To make the motion continuous
            theta_a = theta_b;
            
        end

         
    end   
end

close all;


        
        
        

    
    
