function [perm_theta] = find_all_perm_theta(t, l0, l1, l2, l4)

%     l(1) = Link([0, 10, 0, pi/2]);
%     l(2) = Link([0, -2, 0, pi/2]);
%     l(3) = Link([0, -5, 0, pi/2]);
%     l(4) = Link([0, 0, 0, pi/2]);
%     l(5) = Link([0, 10, 0, pi/2]);
% 
%     li = SerialLink(l, 'name', '5link');
%     
%     kin_angles_test = [0.1486, 1.361, 0.3421, 1.1984, 0.271];
%     t = li.fkine(kin_angles_test);
%     l0 = 10;
%     l1 = 2;
%     l2 = 5;
%     l4 = 10;


    
    %We hardcode the permutation sequence
    %Some of the values are redundant and have been removed
    %after observation
    
    %We start by finding the 2 values of theta0
    [theta0a, theta0b] = find_theta0(t, l1, l4);
    
    %Values of theta1
    [theta1a1, theta1a2] = find_theta1(t, theta0a, l2, l4);
    
    %Values of theta3
    [theta3a1, theta3a2] = find_theta3(t, theta0a, theta1a1);
    [theta3a3, theta3a4] = find_theta3(t, theta0a, theta1a2);
    [theta3b1, theta3b2] = find_theta3(t, theta0b, theta1a1);
    [theta3b3, theta3b4] = find_theta3(t, theta0b, theta1a2);
    
    %Values of theta2
    [theta2a1, theta2a2] = find_theta2(t, theta0a, theta3a1);
    [theta2a3, theta2a4] = find_theta2(t, theta0a, theta3a3);
    
    [theta2b1, theta2b2] = find_theta2(t, theta0b, theta3b1);
    [theta2b3, theta2b4] = find_theta2(t, theta0b, theta3b3);
    
    
    %Values of theta4
    [theta4a1, theta4a2] = find_theta4(t, theta0a, theta1a1, theta3a1);
    [theta4a3, theta4a4] = find_theta4(t, theta0a, theta1a2, theta3a3);
    
    
    [theta4b1, theta4b2] = find_theta4(t, theta0b, theta1a1, theta3b1);
    [theta4b3, theta4b4] = find_theta4(t, theta0b, theta1a2, theta3b3);
    
    perm_theta = [theta0a theta1a1 theta3a1 theta2a1 theta4a1;
                  theta0a theta1a1 theta3a1 theta2a1 theta4a2;
                  theta0a theta1a1 theta3a1 theta2a2 theta4a1;
                  theta0a theta1a1 theta3a1 theta2a2 theta4a2;
                  theta0a theta1a1 theta3a2 theta2a1 theta4a1;
                  theta0a theta1a1 theta3a2 theta2a1 theta4a2;
                  theta0a theta1a1 theta3a2 theta2a2 theta4a1;
                  theta0a theta1a1 theta3a2 theta2a2 theta4a2;
                  theta0a theta1a2 theta3a3 theta2a3 theta4a3;
                  theta0a theta1a2 theta3a3 theta2a3 theta4a4;
                  theta0a theta1a2 theta3a3 theta2a4 theta4a3;
                  theta0a theta1a2 theta3a3 theta2a4 theta4a4;
                  theta0a theta1a2 theta3a4 theta2a3 theta4a3;
                  theta0a theta1a2 theta3a4 theta2a3 theta4a4;
                  theta0a theta1a2 theta3a4 theta2a4 theta4a3;
                  theta0a theta1a2 theta3a4 theta2a4 theta4a4;
                  theta0b theta1a1 theta3b1 theta2b1 theta4b1;
                  theta0b theta1a1 theta3b1 theta2b1 theta4b2;
                  theta0b theta1a1 theta3b1 theta2b2 theta4b1;
                  theta0b theta1a1 theta3b1 theta2b2 theta4b2;
                  theta0b theta1a1 theta3b2 theta2b1 theta4b1;
                  theta0b theta1a1 theta3b2 theta2b1 theta4b2;
                  theta0b theta1a1 theta3b2 theta2b2 theta4b1;
                  theta0b theta1a1 theta3b2 theta2b2 theta4b2;
                  theta0b theta1a2 theta3b3 theta2b3 theta4b3;
                  theta0b theta1a2 theta3b3 theta2b3 theta4b4;
                  theta0b theta1a2 theta3b3 theta2b4 theta4b3;
                  theta0b theta1a2 theta3b3 theta2b4 theta4b4;
                  theta0b theta1a2 theta3b4 theta2b3 theta4b3;
                  theta0b theta1a2 theta3b4 theta2b3 theta4b4;
                  theta0b theta1a2 theta3b4 theta2b4 theta4b3;
                  theta0b theta1a2 theta3b4 theta2b4 theta4b4;];
                
    
end
    
    
    
    
    