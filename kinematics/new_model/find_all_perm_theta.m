function [perm_theta] = find_all_perm_theta(t, l0, l1, l2, l4)

    [theta0a, theta0b] = find_theta0(t, l1, l4);
    
    %Values of theta1
    [theta1a1, theta1a2] = find_theta1(t, theta0a, l2, l4);
    [theta1b1, theta1b2] = find_theta1(t, theta0b, l2, l4);
    
    %Values of theta3
    [theta3a1, theta3a2] = find_theta3(t, theta0a, theta1a1);
    [theta3a3, theta3a4] = find_theta3(t, theta0a, theta1a2);
    [theta3b1, theta3b2] = find_theta3(t, theta0b, theta1b1);
    [theta3b3, theta3b4] = find_theta3(t, theta0b, theta1b2);
    
    %Values of theta2
    [theta2a1, theta2a2] = find_theta2(t, theta0a, theta3a1);
    [theta2a3, theta2a4] = find_theta2(t, theta0a, theta3a2);
    [theta2a5, theta2a6] = find_theta2(t, theta0a, theta3a3);
    [theta2a7, theta2a8] = find_theta2(t, theta0a, theta3a4);
    
    [theta2b1, theta2b2] = find_theta2(t, theta0b, theta3b1);
    [theta2b3, theta2b4] = find_theta2(t, theta0b, theta3b2);
    [theta2b5, theta2b6] = find_theta2(t, theta0b, theta3b3);
    [theta2b7, theta2b8] = find_theta2(t, theta0b, theta3b4);
    
    
    %Values of theta4
    [theta4a1, theta4a2] = find_theta4(t, theta0a, theta1a1, theta3a1);
    [theta4a3, theta4a4] = find_theta4(t, theta0a, theta1a1, theta3a2);
    [theta4a5, theta4a6] = find_theta4(t, theta0a, theta1a2, theta3a3);
    [theta4a7, theta4a8] = find_theta4(t, theta0a, theta1a2, theta3a4);
    
    
    [theta4b1, theta4b2] = find_theta4(t, theta0b, theta1b1, theta3b1);
    [theta4b3, theta4b4] = find_theta4(t, theta0b, theta1b1, theta3b2);
    [theta4b5, theta4b6] = find_theta4(t, theta0b, theta1b2, theta3b3);
    [theta4b7, theta4b8] = find_theta4(t, theta0b, theta1b2, theta3b4);
    
    perm_theta = [theta0a theta1a1 theta3a1 theta2a1 theta4a1;
                  theta0a theta1a1 theta3a1 theta2a1 theta4a2;
                  theta0a theta1a1 theta3a1 theta2a2 theta4a1;
                  theta0a theta1a1 theta3a1 theta2a2 theta4a2;
                  theta0a theta1a1 theta3a2 theta2a3 theta4a3;
                  theta0a theta1a1 theta3a2 theta2a3 theta4a4;
                  theta0a theta1a1 theta3a2 theta2a4 theta4a3;
                  theta0a theta1a1 theta3a2 theta2a4 theta4a4;
                  
                  theta0a theta1a2 theta3a3 theta2a5 theta4a5;
                  theta0a theta1a2 theta3a3 theta2a5 theta4a6;
                  theta0a theta1a2 theta3a3 theta2a6 theta4a5;
                  theta0a theta1a2 theta3a3 theta2a6 theta4a6;
                  theta0a theta1a2 theta3a4 theta2a7 theta4a7;
                  theta0a theta1a2 theta3a4 theta2a7 theta4a8;
                  theta0a theta1a2 theta3a4 theta2a8 theta4a7;
                  theta0a theta1a2 theta3a4 theta2a8 theta4a8;
                  
                  theta0b theta1b1 theta3b1 theta2b1 theta4b1;
                  theta0b theta1b1 theta3b1 theta2b1 theta4b2;
                  theta0b theta1b1 theta3b1 theta2b2 theta4b1;
                  theta0b theta1b1 theta3b1 theta2b2 theta4b2;
                  theta0b theta1b1 theta3b2 theta2b3 theta4b3;
                  theta0b theta1b1 theta3b2 theta2b3 theta4b4;
                  theta0b theta1b1 theta3b2 theta2b4 theta4b3;
                  theta0b theta1b1 theta3b2 theta2b4 theta4b4;
                  
                  theta0b theta1b2 theta3b3 theta2b5 theta4b5;
                  theta0b theta1b2 theta3b3 theta2b5 theta4b6;
                  theta0b theta1b2 theta3b3 theta2b6 theta4b5;
                  theta0b theta1b2 theta3b3 theta2b6 theta4b6;
                  theta0b theta1b2 theta3b4 theta2b7 theta4b7;
                  theta0b theta1b2 theta3b4 theta2b7 theta4b8;
                  theta0b theta1b2 theta3b4 theta2b8 theta4b7;
                  theta0b theta1b2 theta3b4 theta2b8 theta4b8;];
  
              

    
%     perm_theta = [theta0a theta1a1 theta3a1 theta2a1 theta4a1;
%                   theta0a theta1a1 theta3a1 theta2a1 theta4a2;
%                   theta0a theta1a1 theta3a1 theta2a2 theta4a1;
%                   theta0a theta1a1 theta3a1 theta2a2 theta4a2;
%                   theta0a theta1a1 theta3a2 theta2a1 theta4a1;
%                   theta0a theta1a1 theta3a2 theta2a1 theta4a2;
%                   theta0a theta1a1 theta3a2 theta2a2 theta4a1;
%                   theta0a theta1a1 theta3a2 theta2a2 theta4a2;
%                   theta0a theta1a2 theta3a3 theta2a3 theta4a3;
%                   theta0a theta1a2 theta3a3 theta2a3 theta4a4;
%                   theta0a theta1a2 theta3a3 theta2a4 theta4a3;
%                   theta0a theta1a2 theta3a3 theta2a4 theta4a4;
%                   theta0a theta1a2 theta3a4 theta2a3 theta4a3;
%                   theta0a theta1a2 theta3a4 theta2a3 theta4a4;
%                   theta0a theta1a2 theta3a4 theta2a4 theta4a3;
%                   theta0a theta1a2 theta3a4 theta2a4 theta4a4;
%                   theta0b theta1a1 theta3b1 theta2b1 theta4b1;
%                   theta0b theta1a1 theta3b1 theta2b1 theta4b2;
%                   theta0b theta1a1 theta3b1 theta2b2 theta4b1;
%                   theta0b theta1a1 theta3b1 theta2b2 theta4b2;
%                   theta0b theta1a1 theta3b2 theta2b1 theta4b1;
%                   theta0b theta1a1 theta3b2 theta2b1 theta4b2;
%                   theta0b theta1a1 theta3b2 theta2b2 theta4b1;
%                   theta0b theta1a1 theta3b2 theta2b2 theta4b2;
%                   theta0b theta1a2 theta3b3 theta2b3 theta4b3;
%                   theta0b theta1a2 theta3b3 theta2b3 theta4b4;
%                   theta0b theta1a2 theta3b3 theta2b4 theta4b3;
%                   theta0b theta1a2 theta3b3 theta2b4 theta4b4;
%                   theta0b theta1a2 theta3b4 theta2b3 theta4b3;
%                   theta0b theta1a2 theta3b4 theta2b3 theta4b4;
%                   theta0b theta1a2 theta3b4 theta2b4 theta4b3;
%                   theta0b theta1a2 theta3b4 theta2b4 theta4b4;];
                
    
end
    
    
    
    
    