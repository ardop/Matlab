function t = fkval(theta0, theta1, theta2, theta3, theta4, l0, l1, l2, l4)

%l0 = 14.2;
%l1 = 1.8
%l2 = 14.5;
clc;

l(1) = Link([0, l0, 0, pi/2]);
l(2) = Link([0, -l1, 0, pi/2]);
l(3) = Link([0, -l2, 0, pi/2]);
l(4) = Link([0, 0, 0, pi/2]);
l(5) = Link([0, l4, 0, pi/2]);

li = SerialLink(l, 'name', '5link');
t = li.fkine([theta0, theta1, theta2, theta3, theta4]);