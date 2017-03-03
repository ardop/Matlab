function [g] = calc_g_analytical(theta)

    [theta1, theta2, theta3, theta4, theta5, theta6, theta7] = thetamap(theta);
    g = zeros(4, 4);
    
    l1 = 14.2;
    l2 = 1.8;
    l3 = 14.5;
    l5 = 29.5;
    
    g(1, 1) = cos(theta3)*cos(theta4)*sin(theta5)*sin(theta7)-cos(theta5)*sin(theta3)*sin(theta7)+cos(theta3)*cos(theta7)*sin(theta4)*sin(theta6)+cos(theta6)*cos(theta7)*sin(theta3)*sin(theta5)+cos(theta3)*cos(theta4)*cos(theta5)*cos(theta6)*cos(theta7);
    g(1, 2) = sin(theta3)*sin(theta5)*sin(theta6)-cos(theta3)*cos(theta6)*sin(theta4)+cos(theta3)*cos(theta4)*cos(theta5)*sin(theta6);
    g(1, 3) = cos(theta5)*cos(theta7)*sin(theta3)-cos(theta3)*cos(theta4)*cos(theta7)*sin(theta5)+cos(theta3)*sin(theta4)*sin(theta6)*sin(theta7)+cos(theta6)*sin(theta3)*sin(theta5)*sin(theta7)+cos(theta3)*cos(theta4)*cos(theta5)*cos(theta6)*sin(theta7);
    g(1, 4) = l5*cos(theta3)*sin(theta4);
    g(2, 1) = cos(theta3)*cos(theta5)*sin(theta7)-cos(theta3)*cos(theta6)*cos(theta7)*sin(theta5)+cos(theta4)*sin(theta3)*sin(theta5)*sin(theta7)+cos(theta7)*sin(theta3)*sin(theta4)*sin(theta6)+cos(theta4)*cos(theta5)*cos(theta6)*cos(theta7)*sin(theta3);
    g(2, 2) = cos(theta4)*cos(theta5)*sin(theta3)*sin(theta6)-cos(theta3)*sin(theta5)*sin(theta6)-cos(theta6)*sin(theta3)*sin(theta4);
    g(2, 3) = sin(theta3)*sin(theta4)*sin(theta6)*sin(theta7)-cos(theta4)*cos(theta7)*sin(theta3)*sin(theta5)-cos(theta3)*cos(theta6)*sin(theta5)*sin(theta7)-cos(theta3)*cos(theta5)*cos(theta7)+cos(theta4)*cos(theta5)*cos(theta6)*sin(theta3)*sin(theta7);
    g(2, 4) = l5*sin(theta3)*sin(theta4);
    g(3, 1) = sin(theta4)*sin(theta5)*sin(theta7)-cos(theta4)*cos(theta7)*sin(theta6)+cos(theta5)*cos(theta6)*cos(theta7)*sin(theta4);
    g(3, 2) = cos(theta4)*cos(theta6)+cos(theta5)*sin(theta4)*sin(theta6);
    g(3, 3) = cos(theta5)*cos(theta6)*sin(theta4)*sin(theta7)-cos(theta4)*sin(theta6)*sin(theta7)-cos(theta7)*sin(theta4)*sin(theta5);
    g(3, 4) = -l3-l5*cos(theta4);
    g(4, 1) = 0;
    g(4, 2) = 0;
    g(4, 3) = 0;
    g(4, 4) = 1;
    
end