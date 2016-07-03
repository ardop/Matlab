function [c] = get_coord(t)

    %Get coordinates from homogeneous transformation matrix
    x = t(1, 4);
    y = t(2, 4);
    z = t(3, 4);
    c = [x y z];
    
end