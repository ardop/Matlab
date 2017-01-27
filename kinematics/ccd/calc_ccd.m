function [theta] = calc_ccd(theta_default, t)

theta = [theta_default, 0, 0, 0];

l1 = 14.2;
l2 = 1.8;
l3 = 14.5;
l5 = 29.5;

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




% while(true)
for ii = 1:100
    
    theta1 = theta(1);
    theta2 = theta(2);
    theta3 = theta(3);
    theta4 = theta(4);
    theta5 = theta(5);
    
    a = [cos(theta1) 0 sin(theta1) 0; sin(theta1) 0 -cos(theta1) 0; 0 1 0 l1; 0 0 0 1];
    b = [cos(theta2) 0 sin(theta2) 0; sin(theta2) 0 -cos(theta2) 0; 0 1 0 -l2; 0 0 0 1];
    c = [cos(theta3) 0 sin(theta3) 0; sin(theta3) 0 -cos(theta3) 0; 0 1 0 -l3; 0 0 0 1];
    d = [cos(theta4) 0 sin(theta4) 0; sin(theta4) 0 -cos(theta4) 0; 0 1 0 0; 0 0 0 1];
    e = [cos(theta5) 0 sin(theta5) 0; sin(theta5) 0 -cos(theta5) 0; 0 1 0 l5; 0 0 0 1];


    fk = a*b*c*d*e;
    disp(fk);
    e_pos = get_coord(fk);
    err = dst(e_pos, t);
    if(err<0.1)
%         disp('djhfjd');
        break
    end
    
    
    for i=1:4
        
        theta1 = theta(1);
        theta2 = theta(2);
        theta3 = theta(3);
        theta4 = theta(4);
        theta5 = theta(5);
        
        a = [cos(theta1) 0 sin(theta1) 0; sin(theta1) 0 -cos(theta1) 0; 0 1 0 l1; 0 0 0 1];
        b = [cos(theta2) 0 sin(theta2) 0; sin(theta2) 0 -cos(theta2) 0; 0 1 0 -l2; 0 0 0 1];
        c = [cos(theta3) 0 sin(theta3) 0; sin(theta3) 0 -cos(theta3) 0; 0 1 0 -l3; 0 0 0 1];
        d = [cos(theta4) 0 sin(theta4) 0; sin(theta4) 0 -cos(theta4) 0; 0 1 0 0; 0 0 0 1];
        e = [cos(theta5) 0 sin(theta5) 0; sin(theta5) 0 -cos(theta5) 0; 0 1 0 l5; 0 0 0 1];
        
        e_pos = get_coord(a*b*c*d*e);
        
        if(i==1)
            fk = a*b*c*d;
        elseif(i==2)
            fk = a*b*c;
        elseif(i==3)
            fk = a*b;
        elseif(i==4)
            fk = a;
        end
        
        j_pos = get_coord(fk);
        
        aa = (e_pos - j_pos)/norm(e_pos - j_pos);
        bb = (t - j_pos)/norm(t - j_pos);
        
        theta_change = acos(dot(aa, bb));
        
        %For direction ---------------------------------------
        
        
        theta_tmpa = theta;
        theta_tmpa(5-i) = theta_tmpa(5-i) + theta_change;
        theta_tmpb = theta;
        theta_tmpb(5-i) = theta_tmpb(5-i) - theta_change;
        
        theta1 = theta_tmpa(1);
        theta2 = theta_tmpa(2);
        theta3 = theta_tmpa(3);
        theta4 = theta_tmpa(4);
        theta5 = theta_tmpa(5);
        
        a = [cos(theta1) 0 sin(theta1) 0; sin(theta1) 0 -cos(theta1) 0; 0 1 0 l1; 0 0 0 1];
        b = [cos(theta2) 0 sin(theta2) 0; sin(theta2) 0 -cos(theta2) 0; 0 1 0 -l2; 0 0 0 1];
        c = [cos(theta3) 0 sin(theta3) 0; sin(theta3) 0 -cos(theta3) 0; 0 1 0 -l3; 0 0 0 1];
        d = [cos(theta4) 0 sin(theta4) 0; sin(theta4) 0 -cos(theta4) 0; 0 1 0 0; 0 0 0 1];
        e = [cos(theta5) 0 sin(theta5) 0; sin(theta5) 0 -cos(theta5) 0; 0 1 0 l5; 0 0 0 1];
        
        e_pos = get_coord(a*b*c*d*e);
        erra = dst(e_pos, t);
        
        theta1 = theta_tmpb(1);
        theta2 = theta_tmpb(2);
        theta3 = theta_tmpb(3);
        theta4 = theta_tmpb(4);
        theta5 = theta_tmpb(5);
        
        a = [cos(theta1) 0 sin(theta1) 0; sin(theta1) 0 -cos(theta1) 0; 0 1 0 l1; 0 0 0 1];
        b = [cos(theta2) 0 sin(theta2) 0; sin(theta2) 0 -cos(theta2) 0; 0 1 0 -l2; 0 0 0 1];
        c = [cos(theta3) 0 sin(theta3) 0; sin(theta3) 0 -cos(theta3) 0; 0 1 0 -l3; 0 0 0 1];
        d = [cos(theta4) 0 sin(theta4) 0; sin(theta4) 0 -cos(theta4) 0; 0 1 0 0; 0 0 0 1];
        e = [cos(theta5) 0 sin(theta5) 0; sin(theta5) 0 -cos(theta5) 0; 0 1 0 l5; 0 0 0 1];
        
        e_pos = get_coord(a*b*c*d*e);
        errb = dst(e_pos, t);
        
        %Direction ends -------------------------------
        
        if(erra<errb)
            theta(5-i) = theta(5-i) + theta_change;
        elseif(erra>errb)
            theta(5-i) = theta(5-i) - theta_change;   
        end
        
        if(theta(1)<t1al)
            theta(1) = t1al;
        end
        if(theta(1)>t1bl)
            theta(1) = t1bl;
        end
        
        if(theta(2)<t2al)
            theta(2) = t2al;
        end
        if(theta(2)>t2bl)
            theta(2) = t2bl;
        end
        
        if(theta(3)<t3al)
            theta(3) = t3al;
        end
        if(theta(3)>t3bl)
            theta(3) = t3bl;
        end
        
        if(theta(4)<t4al)
            theta(4) = t4al;
        end
        if(theta(4)>t4bl)
            theta(4) = t4bl;
        end
        





        
%         disp(theta(1:4));
    end
    
    
    
end

% disp('Final angles');
% disp(theta(1:4));
disp('Target');
disp(t);
disp('Calulated');
disp(e_pos);
            
            

    

end
    
    
        
        
 