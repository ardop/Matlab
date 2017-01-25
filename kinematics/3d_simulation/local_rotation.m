function [a] = local_rotation(axis, angle)

    si = sin(angle);
    co = cos(angle);
    
    if axis=='z'
        a = [co si 0; -si co 0; 0 0 1];
    elseif axis=='y'
        a = [co 0 -si; 0 1 0; si 0 co];
    elseif axis=='x'
        a = [1 0 0; 0 co si; 0 -si co];
    end
end