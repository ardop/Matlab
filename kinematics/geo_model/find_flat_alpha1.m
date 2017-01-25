function [alpha11, alpha12] = find_flat_alpha1(x, l2)

    num = sqrt(l2*l2 - x*x);
    den = x;

    alpha11 = atan2(num, den);
    alpha12 = -atan2(num, den);
    
end