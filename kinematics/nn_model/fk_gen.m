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

%Storing inputs and target for the neural network model
y = [];
x = [];

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
    
%     theta0=-1.2;
%     theta1=0.2;
%     theta2=0.0;
%     theta3=-1.2;
%     theta4=1.3;
    
    kin_angles_test = [theta0, theta1, theta2, theta3, theta4];
    y = [y; kin_angles_test];
    fkmatp = li.fkine(kin_angles_test);
    
%     Now we extract the coordinates from the forward kinematics matrix
    p = extract_coord(fkmatp);
    x = [x; p'];
    
    
end
    
save('x.mat', 'x');
save('y.mat', 'y');   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    