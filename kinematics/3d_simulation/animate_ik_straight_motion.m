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
    
    in = input('Enter the first and second end-effector coordinate values.\nEnter q to quit.\n', 's');
    if in=='q'
        break
        
    else
        in = strsplit(in);
        target = str2double(in);
        target1 = target(1:3);
        target2 = target(4:6);
        
        % First we move to target 1
        
        theta_a = move_to_target(target1, theta_a);
        
        % Now we move from target 1 to target 2 in straight lines
        
        delta = (target2-target1)/10;
        
        for ii=1:10
            theta_a = move_to_target(target1+ii*delta, theta_a');
        end
        
        
        
        
        
%         theta_a = move_to_target(target, theta_a);  
         
    end   
end

close all;
        
        
        

    
    
