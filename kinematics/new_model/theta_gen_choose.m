clc;

l0 = 14.2;
l1 = 1.8;
l2 = 14.5;
l4 = 29.5;

l(1) = Link([0, 14.2, 0, pi/2]);
l(2) = Link([0, -1.8, 0, pi/2]);
l(3) = Link([0, -14.5, 0, pi/2]);
l(4) = Link([0, 0, 0, pi/2]);
l(5) = Link([0, 29.5, 0, pi/2]);

%limits of theta to calculate the random values
t0b = 0.0;
t0a = -2.6179;
t1b = 1.5707;
t1a = 0.0;
t2b = 1.5707;
t2a = -1.5707;
t3b = 0.0;
t3a = -1.5707;
t4b = 1.5707;
t4a = -1.5707;

li = SerialLink(l, 'name', '5link');

for i=1:100
    
    theta0 = (t0b-t0a)*rand + t0a;
    theta1 = (t1b-t1a)*rand + t1a;
    theta2 = (t2b-t2a)*rand + t2a;
    theta3 = (t3b-t3a)*rand + t3a;
    theta4 = (t4b-t4a)*rand + t4a;
    
    kin_angles_test = [theta0, theta1, theta2, theta3, theta4];
    fkmatp = li.fkine(kin_angles_test);
    
    
    %Displaying the angles and fk matrix 
    fprintf('Angles:\n');
    disp(kin_angles_test);
    fprintf('FK matrix:\n');
    disp(fkmatp);

    
    p = find_all_perm_theta(fkmatp, l0, l1, l2, l4);
    perm_theta = [p(:, 1) p(:, 2) p(:, 4) p(:, 3) p(:, 5)]; 
    
    fkmatp = round(fkmatp, 4);

    for j=1:size(perm_theta, 1)
        
        fk = li.fkine(perm_theta(j, :));
        fk = round(fk, 4);
        if isequal(fkmatp, fk)
            disp(j);
            disp(perm_theta(j, :));
            disp(fk);
            fprintf('------------------\n');
        end
    end
    
    pause;
    clc;
    
end