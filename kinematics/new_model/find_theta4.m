function [ans1, ans2] = find_theta4(t, theta0, theta1, theta3)
    
    [nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t);
    
    si = (ax*cos(theta0)*sin(theta1) + ay*sin(theta0)*sin(theta1) - az*cos(theta1))/sin(theta3);
    co = sqrt(1 - si*si);
    
    ans1 = atan(si/co);
    ans2 = atan(-si/co);
    
end