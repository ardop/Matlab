function [theta01, theta02, theta11, theta12, theta21, theta22, theta31, theta32] = find_all_theta(t, l0, l1)

[theta01, theta02] = find_theta0(t, l0, l1);
[theta11, theta12] = find_theta1(t, l0, l1);
[theta21, theta22] = find_theta2(t, l0, l1);
[theta31, theta32] = find_theta3(t, l0, l1);