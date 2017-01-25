function [t1, theta2, t3, t4] = find_theta(t, d)

    [nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t);
    [l1, l2, l3, l5] = dmap(d);
    
%     f14 = px*cos(theta1) + py*sin(theta1);
%     f34 = px*sin(theta1) - py*cos(theta1);
%     k1 = (f34 + l2)/l5;
    
    f24 = pz - l1;
    k2 = f24*f24 - l3^2 - l5^2;
    k3 = px^2 + py^2 + l2^2 + k2;
    
    
    %Finding theta 2 ---------------------------------
    
    k5 = (4*l3*l3*f24*f24)/(px^2 + py^2);
    k6 = (8*l3*l3*l3*f24 + 2*l3*k3*f24)/(px^2 + py^2);
    k7 = (4*(l3^4) + k3^2 + 2*l3*l3*k3)/(px^2 + py^2) - 4*l2*l2;
    
%     b = -k6;
%     a = k5 + 4*l3*l3;
%     c = k7 - 4*l3*l3;
%     
%     if(b*b<4*a*c)
%         disp('No solution');
%         t1 = 'a';
%         theta2 = 'a';
%         t3 = 'a';
%         t4 = 'a';
%         return;
%     end
%     
%     tmpden(1) = (-b + sqrt(b*b - 4*a*c))/(2*a);
%     tmpden(2) = (-b - sqrt(b*b - 4*a*c))/(2*a);
%     
%     tmpnum(1, 1) = sqrt(1-tmpden(1)^2);
%     tmpnum(1, 2) = -sqrt(1-tmpden(1)^2);
%     tmpnum(2, 1) = sqrt(1-tmpden(2)^2);
%     tmpnum(2, 2) = -sqrt(1-tmpden(2)^2);
%     
%     t2(1, 1) = atan2(tmpnum(1, 1), tmpden(1));
%     t2(1, 2) = atan2(tmpnum(1, 2), tmpden(1));
%     t2(2, 1) = atan2(tmpnum(2, 1), tmpden(2));
%     t2(2, 2) = atan2(tmpnum(2, 2), tmpden(2));
%     
%     theta2 = 'a';
%     
%     for i=1:4
%         if(t2(i)<=90 && t2(i)>=0)
%             theta2 = t2(i);
%             break;
%         end
%     end
%     
%     if(theta2 == 'a')
%         disp('No value for theta2');
%         return;
%     end
    
    theta2 = pi/2;
    flag = 0;
    
    while(1)
        
        val = (cos(theta2)^2)*(k5 + 4*l3*l3) - k6*cos(theta2) + k7 - 4*l3*l3;
        
        if(val>0)
            theta2 = theta2 - pi/180;
        else
            flag = 1;
            break;
        end
        
        if(theta2<0)
            break;
        end
        
    end
    
    if(~flag)
        t1 = 'a';
        theta2 = 'a';
        t3 = 'a';
        t4 = 'a';
        disp('No solution');
        return;
    end
    
    
    
    
    %Finding theta1 ----------------------------------
    
    k4 = (pz - l1)*cos(theta2) - l3;
    
    E = 2*l3*k4 - k3;
    B = 2*l3*sin(theta2);
    D = 2*l2;
    
    num = B*px - D*py;
    den = D*px + B*py;
    
    phi = atan2(num, den);
    
    r = sqrt(num^2 + den^2);

    t1(1) = -phi + atan2(E, sqrt(r*r - E*E));
    t1(2) = -phi + atan2(E, -sqrt(r*r - E*E));
    
%     disp(t1(1));
%     disp(t1(2));
    
    %Theta1 has been found---------------------------
    
    %Finding theta 4 --------------------------------
    
    tmpnum = [];
    tmpden = [];
    
    tmpden(1) = (k3 + 2*l2*(px*sin(t1(1)) - py*cos(t1(1))))/(2*l3*l5);
    tmpden(2) = (k3 + 2*l2*(px*sin(t1(2)) - py*cos(t1(2))))/(2*l3*l5);
    
    tmpnum(1) = sqrt(1-tmpden(1)^2);
    tmpnum(2) = sqrt(1-tmpden(2)^2);
    
    t4(1, 1) = atan2(tmpnum(1), tmpden(1)); %Keeping first value of t1
    t4(1, 2) = atan2(-tmpnum(1), tmpden(1));
    t4(2, 1) = atan2(tmpnum(2), tmpden(2)); %Second value of t1
    t4(2, 2) = atan2(-tmpnum(2), tmpden(2));
    
%     disp(t4);
    
    %Theta4 has been found --------------------------
    
    %Finding theta3
    
    tmpnum = [];
    tmpden = [];
    
    f34(1) = px*sin(t1(1)) - py*cos(t1(1));
    f34(2) = px*sin(t1(2)) - py*cos(t1(2));
    
    tmpnum(1, 1) = (f34(1) + l2)/(l5*sin(t4(1, 1)));
    tmpnum(1, 2) = (f34(1) + l2)/(l5*sin(t4(1, 2)));
    tmpnum(2, 1) = (f34(2) + l2)/(l5*sin(t4(2, 1)));
    tmpnum(2, 2) = (f34(2) + l2)/(l5*sin(t4(2, 2)));
    
    tmpden(1, 1) = sqrt(1-tmpnum(1, 1)^2);
    tmpden(1, 2) = sqrt(1-tmpnum(1, 2)^2);
    tmpden(2, 1) = sqrt(1-tmpnum(2, 1)^2);
    tmpden(2, 2) = sqrt(1-tmpnum(2, 2)^2);
    
    t3(1, 1) = atan2(tmpnum(1, 1), tmpden(1, 1));
    t3(1, 2) = atan2(tmpnum(1, 1), -tmpden(1, 1));
    t3(1, 3) = atan2(tmpnum(1, 2), tmpden(1, 2));
    t3(1, 4) = atan2(tmpnum(1, 2), -tmpden(1, 2));
    
    t3(2, 1) = atan2(tmpnum(2, 1), tmpden(2, 1));
    t3(2, 2) = atan2(tmpnum(2, 1), -tmpden(2, 1));
    t3(2, 3) = atan2(tmpnum(2, 2), tmpden(2, 2));
    t3(2, 4) = atan2(tmpnum(2, 2), -tmpden(2, 2));
    
%     disp(t3);
    
    
    

    
end






















