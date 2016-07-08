function theta = calc_theta(type, angles, coord)

    %We need to calculate the FK matrix (T) that translates and 
    %orients points from the end effector coordinate to the base
    %coordinate
    
    %First we find the orientation matrix
    
    orientation_matrix = eye(3);
    
    for i=1:3
        k = type(i); %Going from the back
        %If it is capital, it is global rotation. Pre multiply
        if ismember(k, 'A':'Z')
            rot =  global_rotation(k, angles(i));
            orientation_matrix = rot*orientation_matrix;
        elseif ismember(k, 'a':'z')
            %local rotation. Post multiply.
            rot = global_rotation(k, angles(i));
            orientation_matrix = orientation_matrix*rot;
        end
        
    end
    
    %Now we can find out the transformation matrix
    
    t = [orientation_matrix coord'];
    t = [t; 0 0 0 1];
    
    %Link lengths
    l0 = 14.2;
    l1 = 1.8;
    l2 = 14.5;
    l4 = 29.5;
    
    p = find_all_perm_new_theta(t, l0, l1, l2, l4);
    
    
    
    
    
    
    
end