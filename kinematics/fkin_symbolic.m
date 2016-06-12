syms theta0
syms theta1
syms theta2
syms theta3
syms theta4

syms nx
syms ny
syms nz
syms ox
syms oy
syms oz
syms ax
syms ay
syms az
syms px
syms py
syms pz

syms l0
syms l1
syms l2

clc;
t = [nx ox ax px; ny oy ay py; nz oz az pz; 0 0 0 1];

% theta0 = 0;
% theta1 = 0;
% theta2 = 0;
% theta3 = 0;
% theta4 = 0;

a = [cos(theta0) 0 sin(theta0) 0; sin(theta0) 0 -cos(theta0) 0; 0 1 0 l0; 0 0 0 1];
b = [cos(theta1) 0 sin(theta1) 0; sin(theta1) 0 -cos(theta1) 0; 0 1 0 -l1; 0 0 0 1];
c = [cos(theta2) 0 sin(theta2) 0; sin(theta2) 0 -cos(theta2) 0; 0 1 0 -l2; 0 0 0 1];
d = [cos(theta3) 0 sin(theta3) 0; sin(theta3) 0 -cos(theta3) 0; 0 1 0 0; 0 0 0 1];
e = [cos(theta4) 0 sin(theta4) 0; sin(theta4) 0 -cos(theta4) 0; 0 1 0 l4; 0 0 0 1];

(b^-1)*(a^-1)*t;

fk = a*b*c*d*e;

fkp = b*c*d*e;
