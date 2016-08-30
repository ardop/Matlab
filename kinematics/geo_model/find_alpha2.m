function [alpha2] = find_alpha2(x, yy, l2, alpha1)

    num = yy - l2*sin(alpha1);
    den = x - l2*cos(alpha1);
    
    alpha2 = atan2(num, den) - alpha1;
    
end