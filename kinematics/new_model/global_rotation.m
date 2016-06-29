function [q] = global_rotation(axis, angle)
    
    co = cos(angle);
    si = sin(angle);
    
    if axis=='z'
        q = [co -si 0; si co 0; 0 0 1];

    elseif axis=='y'
        q = [co 0 si; 0 1 0; -si 0 co];
        
    elseif axis=='x'
        q = [1 0 0; 0 co -si; 0 si co];
    end
    
end