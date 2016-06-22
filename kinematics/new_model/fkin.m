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
%l(2) = Link([0, -l1, 0, pi/2]);
%l(3) = Link([0, -l2, 0, pi/2]);
%l(4) = Link([0, 0, 0, pi/2]);
%l(5) = Link([0, l4, 0, pi/2]);

l(1) = Link([0, 10, 0, pi/2]);
l(2) = Link([0, -2, 0, pi/2]);
l(3) = Link([0, -5, 0, pi/2]);
l(4) = Link([0, 0, 0, pi/2]);
l(5) = Link([0, 10, 0, pi/2]);

li = SerialLink(l, 'name', '5link');

kin_angles_symbolic = [theta0, theta1, theta2, theta3, theta4];

%kin_angles_test = [0.925, 1.361, 0.2618, 0.436];
% kin_angles_test = [0.1486, 1.361, 0.3421, 1.1984, 0.271];
% kin_angles_test = [0.227, -0.965,-0.3421, 0.065, -1.176];
kin_angles_test = [-0.55, 1.57, -1.57, 0, 1.57];

%fkmat = li.fkine(kin_angles_symbolic)
fkmatp = li.fkine(kin_angles_test)


p = find_all_perm_theta(fkmatp, 10, 2, 5, 10);
perm_theta = [p(:, 1) p(:, 2) p(:, 4) p(:, 3) p(:, 5)];

fkt = li.fkine(perm_theta(17, :));
disp(fkt);

for i=1:size(perm_theta, 1)
    fk = li.fkine(perm_theta(i, :));
    disp(fk);
    if isequal(fkmatp, fk)
        disp(i);
        disp(perm_theta(i, :));
        fprintf('------------------\n');
    end
end
