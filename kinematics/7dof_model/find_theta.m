function [t1, t3, t4] = find_theta(t, d, theta2)

    [nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t);
    [l1, l2, l3, l5] = dmap(d);
    
%     f14 = px*cos(theta1) + py*sin(theta1);
%     f34 = px*sin(theta1) - py*cos(theta1);
%     k1 = (f34 + l2)/l5;
    
    f24 = pz - l1;
    k2 = f24*f24 - l3^2 - l5^2;
    k3 = px^2 + py^2 + l2^2 + k2;
    k4 = (pz - l1)*cos(theta2) - l3;
    
    %Finding theta1 ----------------------------------
    
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






















