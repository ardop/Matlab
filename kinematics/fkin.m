syms theta0
syms theta1
syms theta2
syms theta3
syms theta4
syms l0
syms l1
syms l2
syms l4

clc;

%l(1) = Link([0, l0, 0, pi/2]);
l(1) = Link([0, 10, 0, pi/2]);
%l(2) = Link([0, -l1, 0, pi/2]);
l(2) = Link([0, -2, 0, pi/2]);
%l(3) = Link([0, -l2, 0, pi/2]);
l(3) = Link([0, -5, 0, pi/2]);
l(4) = Link([0, 0, 0, pi/2]);
%l(5) = Link([0, l4, 0, pi/2]);
l(5) = Link([0, 10, 0, pi/2]);

li = SerialLink(l, 'name', '5link');

kin_angles_symbolic = [theta0, theta1, theta2, theta3, theta4];
%kin_angles_test = [0.925, 1.361, 0.2618, 0.436];
kin_angles_test = [0.1486, 1.361, 0.3421, 1.1984, 0.271];
%fkmat = li.fkine(kin_angles_symbolic)
fkmatp = li.fkine(kin_angles_test)
%ikmat = li.ikine(fkmat, [0 0 0 0], [1 1 1 0 0 0])