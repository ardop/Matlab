function [fkmatp] = fk_manual(kin_angles_test)
% function [] = fk_manual()

    theta1 = kin_angles_test(1);
    theta2 = kin_angles_test(2);
    theta3 = kin_angles_test(3);
    theta4 = kin_angles_test(4);
    theta5 = kin_angles_test(5);
    theta6 = kin_angles_test(6);
    theta7 = kin_angles_test(7);
%     syms theta0
%     syms theta1
%     syms theta2
%     syms theta3
%     syms theta4

    l1 = 14.2;
    l2 = 1.8;
    l3 = 14.5;
    l5 = 29.5;

    a = [cos(theta1) 0 sin(theta1) 0; sin(theta1) 0 -cos(theta1) 0; 0 1 0 l1; 0 0 0 1];
    b = [cos(theta2) 0 sin(theta2) 0; sin(theta2) 0 -cos(theta2) 0; 0 1 0 -l2; 0 0 0 1];
    c = [cos(theta3) 0 sin(theta3) 0; sin(theta3) 0 -cos(theta3) 0; 0 1 0 -l3; 0 0 0 1];
    d = [cos(theta4) 0 sin(theta4) 0; sin(theta4) 0 -cos(theta4) 0; 0 1 0 0; 0 0 0 1];
    e = [cos(theta5) 0 sin(theta5) 0; sin(theta5) 0 -cos(theta5) 0; 0 1 0 l5; 0 0 0 1];
    f = [cos(theta6) 0 sin(theta6) 0; sin(theta6) 0 -cos(theta6) 0; 0 1 0 0; 0 0 0 1];
    g = [cos(theta7) 0 sin(theta7) 0; sin(theta7) 0 -cos(theta7) 0; 0 1 0 0; 0 0 0 1];

    fkmatp = a*b*c*d*e*f*g;

end

