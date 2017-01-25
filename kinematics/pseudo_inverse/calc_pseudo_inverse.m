function [q] = calc_pseudo_inverse(theta_default, t)

q = theta_default';

l1 = 14.2;
l2 = 1.8;
l3 = 14.5;
l5 = 29.5;

disp(q');

% while(true)
for i=1:100
    
    J = calc_jacobian(q);
    pJ = pinv(J);
    
    theta1 = q(1);
    theta2 = q(2);
    theta3 = q(3);
    theta4 = q(4);
    theta5 = 0;
    
    a = [cos(theta1) 0 sin(theta1) 0; sin(theta1) 0 -cos(theta1) 0; 0 1 0 l1; 0 0 0 1];
    b = [cos(theta2) 0 sin(theta2) 0; sin(theta2) 0 -cos(theta2) 0; 0 1 0 -l2; 0 0 0 1];
    c = [cos(theta3) 0 sin(theta3) 0; sin(theta3) 0 -cos(theta3) 0; 0 1 0 -l3; 0 0 0 1];
    d = [cos(theta4) 0 sin(theta4) 0; sin(theta4) 0 -cos(theta4) 0; 0 1 0 0; 0 0 0 1];
    e = [cos(theta5) 0 sin(theta5) 0; sin(theta5) 0 -cos(theta5) 0; 0 1 0 l5; 0 0 0 1];
        
    ti = get_coord(a*b*c*d*e);
    
    q = q + pJ*(t - ti);
    
    disp(q');
    
end

disp('target:');
disp(t);
disp('calculated:');
disp(ti);
    
   
end