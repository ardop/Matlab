function [ans1, ans2] = find_theta2(t, theta0, theta3)
    
    [nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t);
    si = (ox*sin(theta0) - oy*cos(theta0))/sin(theta3);
    co = sqrt(1 - si*si);
    
    ans1 = atan2(si,co);
    ans2 = atan2(si,(-co));
    
end