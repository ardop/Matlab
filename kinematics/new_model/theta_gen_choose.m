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

%limits of theta to calculate the random values left
t0bl = 0.0; %30 degrees
t0al = -(pi-0.523598);
t1bl = 1.5707 + 0.174532; %10 degrees inwards
t1al = -0.523598; %30 degrees above shoulder level
t2bl = pi;
t2al = 0.0;
t3bl = 0.0;
t3al = -1.5707;
t4bl = 1.5707;
t4al = -1.5707;

%limits of theta to calculate the random values right
t0br = -0.523598;
t0ar = -pi;
t1br = 0.523598; %30 degrees above the shoulder
t1ar = -(1.5707 + 0.174532); %10 degrees inwards
t2br = pi;
t2ar = 0.0;
t3br = 0.0;
t3ar = -1.5707;
t4br = 1.5707;
t4ar = -1.5707;

li = SerialLink(l, 'name', '5link');

for i=1:1000
    
    theta0 = (t0bl-t0al)*rand + t0al;
    theta1 = (t1bl-t1al)*rand + t1al;
    theta2 = (t2bl-t2al)*rand + t2al; 
    theta3 = (t3bl-t3al)*rand + t3al;
    theta4 = (t4bl-t4al)*rand + t4al;
    
%     theta0 = (t0br-t0ar)*rand + t0ar;
%     theta1 = (t1br-t1ar)*rand + t1ar;
%     theta2 = (t2br-t2ar)*rand + t2ar;  
%     theta3 = (t3br-t3ar)*rand + t3ar;
%     theta4 = (t4br-t4ar)*rand + t4ar;
    
    kin_angles_test = [theta0, theta1, theta2, theta3, theta4];
    fkmatp = li.fkine(kin_angles_test);
%     fkmatp = fk_manual(kin_angles_test);
    
    
    %Displaying the angles and fk matrix 
    fprintf('Angles:\n');
    disp(kin_angles_test);
    fprintf('FK matrix:\n');
%     disp(fkmatp);

    
    p = find_all_perm_new_theta(fkmatp, l0, l1, l2, l4);
    perm_theta = [p(:, 1) p(:, 2) p(:, 4) p(:, 3) p(:, 5)]; 
    
    fkmatp = round(fkmatp, 4);

    for j=1:size(perm_theta, 1)
        
        fk = li.fkine(perm_theta(j, :));
        fk = round(fk, 4);
        if isequal(fkmatp, fk)
            disp(j);
%             disp(perm_theta(j, :));
%             disp(fk);
            if round(perm_theta(j, :), 4)==round(kin_angles_test, 4)
                fprintf('-------------------\n');
                fprintf('Exact angles and fk matrix:\n');
                disp(j);
                fprintf('-------------------\n');
            end

        end
    end
%     disp(perm_theta);
    
    pause;
    clc;
    
end