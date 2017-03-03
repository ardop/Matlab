function [i] = calc_i_analytical(theta)

    [theta1, theta2, theta3, theta4, theta5, theta6, theta7] = thetamap(theta);
    i = zeros(4, 4);
    
    l1 = 14.2;
    l2 = 1.8;
    l3 = 14.5;
    l5 = 29.5;
    
    i(1, 1) = sin(theta5)*sin(theta7)+cos(theta5)*cos(theta6)*cos(theta7);
    i(1, 2) = cos(theta5)*sin(theta6);
    i(1, 3) = cos(theta5)*cos(theta6)*sin(theta7)-cos(theta7)*sin(theta5);
    i(1, 4) = 0;
    i(2, 1) = cos(theta6)*cos(theta7)*sin(theta5)-cos(theta5)*sin(theta7);
    i(2, 2) = sin(theta5)*sin(theta6);
    i(2, 3) = cos(theta5)*cos(theta7)+cos(theta6)*sin(theta5)*sin(theta7);
    i(2, 4) = 0;
    i(3, 1) = cos(theta7)*sin(theta6);
    i(3, 2) = -cos(theta6);
    i(3, 3) = sin(theta6)*sin(theta7);
    i(3, 4) = l5;
    i(4, 1) = 0;
    i(4, 2) = 0;
    i(4, 3) = 0;
    i(4, 4) = 1;
    
end