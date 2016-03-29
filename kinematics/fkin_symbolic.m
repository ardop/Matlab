syms theta0
syms theta1
syms theta2
syms theta3

syms l0
syms l1
syms l2

a =[cos(theta0) 0 sin(theta0) 0; sin(theta0) 0 -cos(theta0) 0; 0 1 0 l0; 0 0 0 1]
b =[cos(theta1) 0 sin(theta1) 0; sin(theta1) 0 -cos(theta1) 0; 0 1 0 -l1; 0 0 0 1]
c =[cos(theta2) 0 sin(theta2) 0; sin(theta2) 0 -cos(theta2) 0; 0 1 0 -l2; 0 0 0 1]
d =[cos(theta3) 0 sin(theta3) 0; sin(theta3) 0 -cos(theta3) 0; 0 1 0 0; 0 0 0 1]

fk = a*b*c*d

fkp = b*c*d
