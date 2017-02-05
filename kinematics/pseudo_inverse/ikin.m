
clc;

l1 = 14.2;
l2 = 1.8;
l3 = 14.5;
l5 = 29.5;


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

for i=1:100
    
    fprintf('Iteration %d\n\n', i);
    
%     theta1 = (t1bl-t1al)*rand + t1al;
%     theta2 = (t2bl-t2al)*rand + t2al;
%     theta3 = (t3bl-t3al)*rand + t3al; 
%     theta4 = (t4bl-t4al)*rand + t4al;
%     theta5 = (t5bl-t5al)*rand + t5al;
%     theta6 = 0;
%     theta7 = 0;
    
    %p_chosen
    px_c = (pxb-pxa)*rand + pxa;
    py_c = (pyb-pya)*rand + pya;
    pz_c = (pzb-pza)*rand + pza;
    
%     px_c = -30;
    
%     theta = [theta1, theta2, theta3, theta4, theta5, theta6, theta7];  
%     theta_default = [0, pi/2, pi/2, 0];
%     
%     theta_default = [t1al, t2al, t3al, t4al];
%  
%     fkmat = li.fkine(theta);
%     t = get_coord(fkmat);
    
    for j=1:20000
        
        fprintf('Trial %d\n\n', j);
        
        theta1 = (t1bl-t1al)*rand + t1al;
        theta2 = (t2bl-t2al)*rand + t2al;
        theta3 = (t3bl-t3al)*rand + t3al; 
        theta4 = (t4bl-t4al)*rand + t4al;
        theta5 = (t5bl-t5al)*rand + t5al;
        
        theta_default = [theta1, theta2, theta3, theta4];
        
        t = [px_c, py_c, pz_c]';

        tt = calc_pseudo_inverse(theta_default, t);
    
%         fprintf('Angles:\n');
%         disp(theta(1:4));
%         disp('Calculated angles');
%         disp(tt');

        if validate_theta(tt)
            fprintf('Angles:\n');
            disp(theta(1:4));
            disp('Calculated angles');
            disp(tt');
            fprintf('VALID!\n');
%             j=20000;
        
        else
            continue
        end
        pause;
    end

    
    clc;
    
  

end