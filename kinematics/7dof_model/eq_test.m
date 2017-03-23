function [a] = eq_test(theta, px, py, pz)

    [theta1, theta2, theta3, theta4, theta5, theta6, theta7] = thetamap(theta);
    
    l1 = 14.2;
    l2 = 1.8;
    l3 = 14.5;
    l5 = 29.5;
    
    a = 0;
    
    a = -l2*sin(theta2)*sin(theta3) - l2*cos(theta3);

    

    
end