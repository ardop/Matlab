syms theta1
syms theta2
syms theta3
syms theta4
syms theta5
syms theta6
syms theta7

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

syms l1
syms l2
syms l3
syms l5

clc;
t = [nx ox ax px; ny oy ay py; nz oz az pz; 0 0 0 1];

% theta0 = 0;
% theta1 = 0;
% theta2 = 0;
% theta3 = 0;
% theta4 = 0;

a = [cos(theta1) 0 sin(theta1) 0; sin(theta1) 0 -cos(theta1) 0; 0 1 0 l1; 0 0 0 1];
b = [cos(theta2) 0 sin(theta2) 0; sin(theta2) 0 -cos(theta2) 0; 0 1 0 -l2; 0 0 0 1];
c = [cos(theta3) 0 sin(theta3) 0; sin(theta3) 0 -cos(theta3) 0; 0 1 0 -l3; 0 0 0 1];
d = [cos(theta4) 0 sin(theta4) 0; sin(theta4) 0 -cos(theta4) 0; 0 1 0 0; 0 0 0 1];
e = [cos(theta5) 0 sin(theta5) 0; sin(theta5) 0 -cos(theta5) 0; 0 1 0 l5; 0 0 0 1];
f = [cos(theta6) 0 sin(theta6) 0; sin(theta6) 0 -cos(theta6) 0; 0 1 0 0; 0 0 0 1];
g = [cos(theta7) 0 sin(theta7) 0; sin(theta7) 0 -cos(theta7) 0; 0 1 0 0; 0 0 0 1];


T = a*b*c*d*e*f*g;
F = b*c*d*e*f*g;
G = c*d*e*f*g;
H = d*e*f*g;
I = e*f*g;

