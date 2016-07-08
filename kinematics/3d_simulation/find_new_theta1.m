function [ans1, ans2] = find_new_theta1(t, theta0, l0, l4)
    
    [nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t);
    
    num = cos(theta0)*(tan(theta0)*(py - l4*oy) + px - l4*ox);
    den = l4*oz - pz + l0;
    
    ans1 = atan2(num,den);
    ans2 = atan2(-num,-den);
    
end