function [alpha11, alpha12] = find_alpha1(x, yy, l2, l4)

    k = (x*x + yy*yy + l2*l2 - l4*l4)/(2*l2);
    r = sqrt(x*x + yy*yy);
    
    num = k;
    den = sqrt(r*r - k*k);
    
    phi = atan2(x, yy);
    
    alpha11 = atan2(num, den) - phi;
    alpha12 = -atan2(num, den) - phi;
    
end