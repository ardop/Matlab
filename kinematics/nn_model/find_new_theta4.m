function [ans1, ans2] = find_new_theta4(t, theta0, theta1)
    
    [nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t);
    
    num = ax*cos(theta0)*sin(theta1) + ay*sin(theta0)*sin(theta1) - az*cos(theta1);
    den = nx*cos(theta0)*sin(theta1) + ny*sin(theta0)*sin(theta1) - nz*cos(theta1);
    
    ans1 = atan2(num, den);
    ans2 = atan2(-num, -den);

    
end