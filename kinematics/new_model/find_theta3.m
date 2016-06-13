function [ans1, ans2] = find_theta3(t, theta0, theta1)
    
    [nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t);
    
    co = -ox*cos(theta0)*sin(theta1) - oy*sin(theta0)*sin(theta1) + oz*cos(theta1);
    si = sqrt(1 - co*co);
    
    ans1 = atan(si/co);
    ans2 = atan(-si/co);
    
end