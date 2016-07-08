clc;

initial_theta = [0 pi/2 pi/2 0 0];
theta_a = initial_theta;

while(true)
    
    in = input('Enter the Euler notation, 3 Euler angles and 3 coordinate values.\nEnter q to quit.\n', 's');
    if in=='q'
        break
        
    else
        in = strsplit(in);
        eu_type = in(1); %Euler angle type (XYZ, zxZ, etc)
        eu_angles = str2double(in(2:4));
        coord = str2double(in(5:7));
        
        %Finding theta ik
        theta_b = calc_theta(eu_type, eu_angles, coord);

    
    
