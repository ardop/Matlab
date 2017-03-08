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
    
    in = input('Enter the end-effector coordinate values.\nEnter q to quit.\n', 's');
    if in=='q'
        break
        
    else
        in = strsplit(in);
        target = str2double(in);
        
        theta_a = move_to_target(target, theta_a);  
         
    end   
end
        
        
        

    
    
