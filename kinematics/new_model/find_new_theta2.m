function [ans1, ans2] = find_new_theta2(t, theta0, theta1)
    
    [nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t);
    num = ox*sin(theta0) - oy*cos(theta0);
    den = ox*cos(theta0)*cos(theta1) + oy*sin(theta0)*cos(theta1) + oz*sin(theta1);
    
    ans1 = atan2(num, den);
    ans2 = ans1 + pi;

    
end