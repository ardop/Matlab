function [ans1, ans2] = find_new_theta3(t, theta0, theta1, theta2)
    
    [nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t);
    
    num = oy*cos(theta0) - ox*sin(theta0);
    den = sin(theta2)*(ox*cos(theta0)*sin(theta1) + oy*sin(theta0)*sin(theta1) - oz*cos(theta1));
    
    ans1 = atan2(num, den);
    ans2 = atan2(-num, -den);
    
end