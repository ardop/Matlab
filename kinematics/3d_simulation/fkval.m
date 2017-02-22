function t = fkval(theta)

    l1 = 14.2;
    l2 = 1.8;
    l3 = 14.5;
    l5 = 29.5;
    
    theta1 = theta(1);
    theta2 = theta(2);
    theta3 = theta(3);
    theta4 = theta(4);
    theta5 = theta(5);

    l(1) = Link([0, l1, 0, pi/2]);
    l(2) = Link([0, -l2, 0, pi/2]);
    l(3) = Link([0, -l3, 0, pi/2]);
    l(4) = Link([0, 0, 0, pi/2]);
    l(5) = Link([0, l5, 0, pi/2]);

    li = SerialLink(l, 'name', '5link');
    t = li.fkine([theta1, theta2, theta3, theta4, theta5]);
end