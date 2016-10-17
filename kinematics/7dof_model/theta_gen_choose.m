clc;

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

%limits of theta to calculate the random values right
t1br = -0.523598;
t1ar = -pi;
t2br = 0.523598; %30 degrees above the shoulder
t2ar = -(1.5707 + 0.174532); %10 degrees inwards
t3br = pi;
t3ar = 0.0;
t4br = 0.0;
t4ar = -1.5707;
t5br = 1.5707;
t5ar = -1.5707;

pxa = -35;
pxb = 10;
pya = 10;
pyb = 43;
pza = 0;
pzb = 25;

li = SerialLink(l, 'name', '7link');

for i=1:1000
    
    theta1 = (t1bl-t1al)*rand + t1al;
    theta2 = (t2bl-t2al)*rand + t2al;
    theta3 = (t3bl-t3al)*rand + t3al; 
    theta4 = (t4bl-t4al)*rand + t4al;
    theta5 = (t5bl-t5al)*rand + t5al;
    theta6 = 0;
    theta7 = 0;
    
    %p_chosen
    px_c = (pxb-pxa)*rand + pxa;
    py_c = (pyb-pya)*rand + pya;
    pz_c = (pzb-pza)*rand + pza;
    
    px_c = -30;
    
    
    %Instead of choosing the theta values, we choose the final
    %coordinates px, py, and pz and work from there
    
%     theta0 = (t0br-t0ar)*rand + t0ar;
%     theta1 = (t1br-t1ar)*rand + t1ar;
%     theta2 = (t2br-t2ar)*rand + t2ar;  
%     theta3 = (t3br-t3ar)*rand + t3ar;
%     theta4 = (t4br-t4ar)*rand + t4ar;
    
%     theta0=-1.2;
%     theta1=0.2;
%     theta2=0.0;
%     theta3=-1.2;
%     theta4=1.3;
    
    theta = [theta1, theta2, theta3, theta4, theta5, theta6, theta7];
    fkmat = li.fkine(theta);
    
    %Displaying the angles and fk matrix 
    fprintf('Angles:\n');
    disp(theta);
%     fprintf('FK matrix:\n');
%     disp(fkmatp);
  
    fkmat(1, 4) = px_c;
    fkmat(2, 4) = py_c;
    fkmat(3, 4) = pz_c;
    
    [tt1, tt2, tt3, tt4] = find_theta(fkmat, d);
    if(tt2=='a')
        disp('no solution');
        continue;
    end
    
%     disp(tt2*180/pi);

    p = perm_theta(fkmat, d);
    m = size(p, 1);
    p = [p(:, 1) p(:, 2) p(:, 4) p(:, 3)]; 
    v = validate_theta(p, 10*pi/180, 0, 0);
    m = size(v, 1);
    v = [v zeros(m, 1) zeros(m, 1) zeros(m, 1)];
    
    
    
    
    fkmat = round(fkmat, 4);
    

    for j=1:size(v, 1)
        
        fk = li.fkine(v(j, :));
        fk = round(fk, 4);
        ppa = [px_c; py_c; pz_c];
        ppb = fk(1:3, end);
        ppa = round(ppa, 3);
        ppb = round(ppb, 3);
        if(isequal(ppa, ppb))
            disp('-------------------------');
            fprintf('%d %d %d', px_c, py_c, pz_c);
            disp('-------------------------');
        end
        
    end
%     disp(perm_theta);
    
    pause;
    clc;
%     
end