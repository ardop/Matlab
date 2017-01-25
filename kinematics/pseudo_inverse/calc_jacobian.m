function J = calc_jacobian(theta)

l1 = 14.2;
l2 = 1.8;
l3 = 14.5;
l5 = 29.5;

theta1 = theta(1);
theta2 = theta(2);
theta3 = theta(3);
theta4 = theta(4);

j11 = -l5*sin(theta1)*cos(theta2)*cos(theta3)*sin(theta4) + l5*sin(theta1)*cos(theta4)*sin(theta2) + l3*sin(theta1)*sin(theta2) + l5*cos(theta1)*sin(theta3)*sin(theta4) - l2*cos(theta1);
j12 = -l5*cos(theta1)*sin(theta2)*cos(theta3)*sin(theta4) - l5*cos(theta1)*cos(theta4)*cos(theta2) - l3*cos(theta1)*cos(theta2);
j13 = -l5*cos(theta1)*cos(theta2)*sin(theta3)*sin(theta4) + l5*sin(theta1)*cos(theta3)*sin(theta4);
j14 = l5*cos(theta1)*cos(theta2)*cos(theta3)*cos(theta4) + l5*cos(theta1)*sin(theta4)*sin(theta2) + l5*sin(theta1)*sin(theta3)*cos(theta4);

j21 = l5*cos(theta2)*cos(theta3)*cos(theta1)*sin(theta4) - l5*cos(theta4)*cos(theta1)*sin(theta2) - l3*cos(theta1)*sin(theta2) + l5*sin(theta1)*sin(theta3)*sin(theta4) - l2*sin(theta1);
j22 = -l5*sin(theta2)*cos(theta3)*sin(theta1)*sin(theta4) - l5*cos(theta4)*sin(theta1)*cos(theta2) - l3*sin(theta1)*cos(theta2);
j23 = -l5*cos(theta2)*sin(theta3)*sin(theta1)*sin(theta4) - l5*cos(theta1)*cos(theta3)*sin(theta4);
j24 = l5*cos(theta2)*cos(theta3)*sin(theta1)*cos(theta4) +  l5*sin(theta4)*sin(theta1)*sin(theta2) - l5*cos(theta1)*sin(theta3)*cos(theta4);

j31= 0;
j32 = l5*cos(theta3)*cos(theta2)*sin(theta4) - l5*sin(theta2)*cos(theta4) - l3*sin(theta2);
j33 = -l5*sin(theta3)*sin(theta2)*sin(theta4);
j34 = l5*cos(theta3)*sin(theta2)*cos(theta4) - l5*cos(theta2)*sin(theta4);

J = [j11 j12 j13 j14; j21 j22 j23 j24; j31 j32 j33 j34];

end