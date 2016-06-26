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

l(1) = Link([0, 14.2, 0, pi/2]);
l(2) = Link([0, -1.8, 0, pi/2]);
l(3) = Link([0, -14.5, 0, pi/2]);
l(4) = Link([0, 0, 0, pi/2]);
l(5) = Link([0, 29.5, 0, pi/2]);

li = SerialLink(l, 'name', '5link');

kin_angles_symbolic = [theta0, theta1, theta2, theta3, theta4];

%kin_angles_test = [0.925, 1.361, 0.2618, 0.436];
% kin_angles_test = [0.1486, 1.361, 0.3421, 1.1984, 0.271];
% kin_angles_test = [0.227, -0.965,-0.3421, 0.065, -1.176];
% kin_angles_test = [-0.6863    0.0996    1.1323   -0.1030    1.5217];
kin_angles_test = [-1.3371    0.5305   1.2567   -0.9907    -1.2214];


%fkmat = li.fkine(kin_angles_symbolic)
fkmatp = li.fkine(kin_angles_test)


p = find_all_perm_theta(fkmatp, 14.2, 1.8, 14.5, 29.5);
perm_theta = [p(:, 1) p(:, 2) p(:, 4) p(:, 3) p(:, 5)];

%rounding off for comparison purposes
fkmatp = round(fkmatp, 4);

for i=1:size(perm_theta, 1)
    fk = li.fkine(perm_theta(i, :));
    %rounding off
    fk = round(fk, 4);
%     disp(fk);
    if isequal(fkmatp, fk)
        disp(i);
        disp(perm_theta(i, :));
        disp(fk);
        fprintf('------------------\n');
    end
end

%We check if the theta angles are valid
epsilon0 = 0.5235; %30 degrees
epsilon1 = 0.1745; %10 degrees
alpha1 = 0.5235; %30 degrees
% valid_theta = validate_theta(perm_theta, epsilon0, epsilon1, alpha1);
