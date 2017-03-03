function [f] = calc_f_analytical(theta)

    [theta1, theta2, theta3, theta4, theta5, theta6, theta7] = thetamap(theta);
    f = zeros(4, 4);
    
    l1 = 14.2;
    l2 = 1.8;
    l3 = 14.5;
    l5 = 29.5;
    
    f(1, 1) = sin(theta2)*sin(theta4)*sin(theta5)*sin(theta7)-cos(theta4)*cos(theta7)*sin(theta2)*sin(theta6)-cos(theta2)*cos(theta5)*sin(theta3)*sin(theta7)+cos(theta2)*cos(theta3)*cos(theta4)*sin(theta5)*sin(theta7)+cos(theta2)*cos(theta3)*cos(theta7)*sin(theta4)*sin(theta6)+cos(theta2)*cos(theta6)*cos(theta7)*sin(theta3)*sin(theta5)+cos(theta5)*cos(theta6)*cos(theta7)*sin(theta2)*sin(theta4)+cos(theta2)*cos(theta3)*cos(theta4)*cos(theta5)*cos(theta6)*cos(theta7);
    f(1, 2) = cos(theta4)*cos(theta6)*sin(theta2)-cos(theta2)*cos(theta3)*cos(theta6)*sin(theta4)+cos(theta2)*sin(theta3)*sin(theta5)*sin(theta6)+cos(theta5)*sin(theta2)*sin(theta4)*sin(theta6)+cos(theta2)*cos(theta3)*cos(theta4)*cos(theta5)*sin(theta6);
    f(1, 3) = cos(theta2)*cos(theta5)*cos(theta7)*sin(theta3)-cos(theta7)*sin(theta2)*sin(theta4)*sin(theta5)-cos(theta4)*sin(theta2)*sin(theta6)*sin(theta7)-cos(theta2)*cos(theta3)*cos(theta4)*cos(theta7)*sin(theta5)+cos(theta2)*cos(theta3)*sin(theta4)*sin(theta6)*sin(theta7)+cos(theta2)*cos(theta6)*sin(theta3)*sin(theta5)*sin(theta7)+cos(theta5)*cos(theta6)*sin(theta2)*sin(theta4)*sin(theta7)+cos(theta2)*cos(theta3)*cos(theta4)*cos(theta5)*cos(theta6)*sin(theta7);
    f(1, 4) = l5*cos(theta2)*cos(theta3)*sin(theta4)-l5*cos(theta4)*sin(theta2)-l3*sin(theta2);
    f(2, 1) = cos(theta2)*cos(theta4)*cos(theta7)*sin(theta6)-cos(theta5)*sin(theta2)*sin(theta3)*sin(theta7)-cos(theta2)*sin(theta4)*sin(theta5)*sin(theta7)-cos(theta2)*cos(theta5)*cos(theta6)*cos(theta7)*sin(theta4)+cos(theta3)*cos(theta4)*sin(theta2)*sin(theta5)*sin(theta7)+cos(theta3)*cos(theta7)*sin(theta2)*sin(theta4)*sin(theta6)+cos(theta6)*cos(theta7)*sin(theta2)*sin(theta3)*sin(theta5)+cos(theta3)*cos(theta4)*cos(theta5)*cos(theta6)*cos(theta7)*sin(theta2);
    f(2, 2) = sin(theta2)*sin(theta3)*sin(theta5)*sin(theta6)-cos(theta3)*cos(theta6)*sin(theta2)*sin(theta4)-cos(theta2)*cos(theta5)*sin(theta4)*sin(theta6)-cos(theta2)*cos(theta4)*cos(theta6)+cos(theta3)*cos(theta4)*cos(theta5)*sin(theta2)*sin(theta6);
    f(2, 3) = cos(theta5)*cos(theta7)*sin(theta2)*sin(theta3)+cos(theta2)*cos(theta7)*sin(theta4)*sin(theta5)+cos(theta2)*cos(theta4)*sin(theta6)*sin(theta7)-cos(theta3)*cos(theta4)*cos(theta7)*sin(theta2)*sin(theta5)-cos(theta2)*cos(theta5)*cos(theta6)*sin(theta4)*sin(theta7)+cos(theta3)*sin(theta2)*sin(theta4)*sin(theta6)*sin(theta7)+cos(theta6)*sin(theta2)*sin(theta3)*sin(theta5)*sin(theta7)+cos(theta3)*cos(theta4)*cos(theta5)*cos(theta6)*sin(theta2)*sin(theta7);
    f(2, 4) = l3*cos(theta2)+l5*cos(theta2)*cos(theta4)+l5*cos(theta3)*sin(theta2)*sin(theta4);
    f(3, 1) = cos(theta3)*cos(theta5)*sin(theta7)-cos(theta3)*cos(theta6)*cos(theta7)*sin(theta5)+cos(theta4)*sin(theta3)*sin(theta5)*sin(theta7)+cos(theta7)*sin(theta3)*sin(theta4)*sin(theta6)+cos(theta4)*cos(theta5)*cos(theta6)*cos(theta7)*sin(theta3);
    f(3, 2) = cos(theta4)*cos(theta5)*sin(theta3)*sin(theta6)-cos(theta3)*sin(theta5)*sin(theta6)-cos(theta6)*sin(theta3)*sin(theta4);
    f(3, 3) = sin(theta3)*sin(theta4)*sin(theta6)*sin(theta7)-cos(theta4)*cos(theta7)*sin(theta3)*sin(theta5)-cos(theta3)*cos(theta6)*sin(theta5)*sin(theta7)-cos(theta3)*cos(theta5)*cos(theta7)+cos(theta4)*cos(theta5)*cos(theta6)*sin(theta3)*sin(theta7);
    f(3, 4) = l5*sin(theta3)*sin(theta4)-l2;
    f(4, 1) = 0;
    f(4, 2) = 0;
    f(4, 3) = 0;
    f(4, 4) = 1;
    
end

    
    