clc;

kin_angles_test = [-1.8823    0.6912    0.0853   -0.8522    1.1792];
theta0 = kin_angles_test(1);
theta1 = kin_angles_test(2);
theta2 = kin_angles_test(3);
theta3 = kin_angles_test(4);
theta4 = kin_angles_test(5);

l0 = 14.2;
l1 = 1.8;
l2 = 14.5;
l4 = 29.5;

a = [cos(theta0) 0 sin(theta0) 0; sin(theta0) 0 -cos(theta0) 0; 0 1 0 l0; 0 0 0 1];
b = [cos(theta1) 0 sin(theta1) 0; sin(theta1) 0 -cos(theta1) 0; 0 1 0 -l1; 0 0 0 1];
c = [cos(theta2) 0 sin(theta2) 0; sin(theta2) 0 -cos(theta2) 0; 0 1 0 -l2; 0 0 0 1];
d = [cos(theta3) 0 sin(theta3) 0; sin(theta3) 0 -cos(theta3) 0; 0 1 0 0; 0 0 0 1];
e = [cos(theta4) 0 sin(theta4) 0; sin(theta4) 0 -cos(theta4) 0; 0 1 0 l4; 0 0 0 1];

fkmat = a*b*c*d*e;
disp(fkmat);

l(1) = Link([0, 14.2, 0, pi/2]);
l(2) = Link([0, -1.8, 0, pi/2]);
l(3) = Link([0, -14.5, 0, pi/2]);
l(4) = Link([0, 0, 0, pi/2]);
l(5) = Link([0, 29.5, 0, pi/2]);

li = SerialLink(l, 'name', '5link');

kin_angles_test = [-1.8823    0.6912    0.0853   -0.8522    1.1792];
fkmatp = li.fkine(kin_angles_test);
disp(fkmatp);