function [xx, yy, zz] = map_coord(c)
    
    x = c(1);
    y = c(2);
    z = c(3);
    
    %Defines position of the base coordinate origin wrt matlab
    %plot3 origin
    x_offset = 30;
    y_offset = 0;
    z_offset = 60;
    
    %Now we reorient
    xx = y;
    yy = z;
    zz = x;
    
    %We offset to account for origin shift
    xx = xx + x_offset;
    yy = yy + y_offset;
    zz = zz + z_offset;

    
end