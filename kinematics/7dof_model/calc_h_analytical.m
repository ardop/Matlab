function [h] = calc_g_analytical(theta)

    [theta1, theta2, theta3, theta4, theta5, theta6, theta7] = thetamap(theta);
    h = zeros(4, 4);
    
    l1 = 14.2;
    l2 = 1.8;
    l3 = 14.5;
    l5 = 29.5;
    
    h(1, 1) = cos(theta4)*sin(theta5)*sin(theta7)+cos(theta7)*sin(theta4)*sin(theta6)+cos(theta4)*cos(theta5)*cos(theta6)*cos(theta7);
    h(1, 2) = cos(theta4)*cos(theta5)*sin(theta6)-cos(theta6)*sin(theta4);
    h(1, 3) = sin(theta4)*sin(theta6)*sin(theta7)-cos(theta4)*cos(theta7)*sin(theta5)+cos(theta4)*cos(theta5)*cos(theta6)*sin(theta7);
    h(1, 4) = l5*sin(theta4);
    h(2, 1) = sin(theta4)*sin(theta5)*sin(theta7)-cos(theta4)*cos(theta7)*sin(theta6)+cos(theta5)*cos(theta6)*cos(theta7)*sin(theta4);
    h(2, 2) = cos(theta4)*cos(theta6)+cos(theta5)*sin(theta4)*sin(theta6);
    h(2, 3) = cos(theta5)*cos(theta6)*sin(theta4)*sin(theta7)-cos(theta4)*sin(theta6)*sin(theta7)-cos(theta7)*sin(theta4)*sin(theta5);
    h(2, 4) = -l5*cos(theta4);
    h(3, 1) = cos(theta6)*cos(theta7)*sin(theta5)-cos(theta5)*sin(theta7);
    h(3, 2) = sin(theta5)*sin(theta6);
    h(3, 3) = cos(theta5)*cos(theta7)+cos(theta6)*sin(theta5)*sin(theta7);
    h(3, 4) = 0;
    h(4, 1) = 0;
    h(4, 2) = 0;
    h(4, 3) = 0;
    h(4, 4) = 1;
    
end