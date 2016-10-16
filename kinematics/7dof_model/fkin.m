clc;
clear all;

l1 = 14.2;
l2 = 1.8;
l3 = 14.5;
l5 = 29.5;

d = [l1, l2, l3, l5];

l(1) = Link([0, l1, 0, pi/2]);
l(2) = Link([0, -l2, 0, pi/2]);
l(3) = Link([0, -l3, 0, pi/2]);
l(4) = Link([0, 0, 0, pi/2]);
l(5) = Link([0, l5, 0, pi/2]);
l(6) = Link([0, 0, 0, pi/2]);
l(7) = Link([0, 0, 0, pi/2]);

li = SerialLink(l, 'name', '7link');

kin_angles_initial_left = [0, pi/2, pi/2, 0, 0, 0, 0];
kin_angles_initial_right = [-pi, -pi/2, pi/2, 0, 0, 0, 0];

%limits of theta to calculate the random values left
t1bl = 0.0; %30 degrees
t1al = -(pi-0.523598);
t2bl = 1.5707 + 0.174532; %10 degrees inwards
t2al = -0.523598; %30 degrees above shoulder level
t3bl = pi;
t3al = 0.0;
t4bl = 0.0;
t4al = -1.5707;
t5bl = 1.5707;
t5al = -1.5707;

theta1 = (t1bl-t1al)*rand + t1al;
theta2 = (t2bl-t2al)*rand + t2al;
theta3 = (t3bl-t3al)*rand + t3al; 
theta4 = (t4bl-t4al)*rand + t4al;
theta5 = (t5bl-t5al)*rand + t5al;
theta6 = 0;
theta7 = 0;

theta = [theta1, theta2, theta3, theta4, theta5, theta6, theta7];
fkmat = li.fkine(theta);



% fkmat = li.fkine(kin_angles_symbolic)

% fkmatp = li.fkine(kin_angles_initial_right)

[t1] = find_theta(fkmat, d, theta2);
disp(theta);



% p = find_all_perm_new_theta(fkmatp, 14.2, 1.8, 14.5, 29.5);
% % p = find_all_theta(fkmatp, 14.2, 1.8, 14.5, 29.5)
% 
% perm_theta = [p(:, 1) p(:, 2) p(:, 3) p(:, 5) p(:, 4)];
% 
% %rounding off for comparison purposes
% fkmatp = round(fkmatp, 6);
% 
% for i=1:size(perm_theta, 1)
%     fk = li.fkine(perm_theta(i, :));
%     %rounding off
%     fk = round(fk, 6);
% %     disp(fk);
%     if isequal(fkmatp, fk)
%         disp(i);
%         disp(perm_theta(i, :));
%         disp(fk);
%         fprintf('------------------\n');
%     end
% end
% 
% %We check if the theta angles are valid
% epsilon0 = 0.5235; %30 degrees
% epsilon1 = 0.1745; %10 degrees
% alpha1 = 0.5235; %30 degrees
% % valid_theta = validate_theta(perm_theta, epsilon0, epsilon1, alpha1);
