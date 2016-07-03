function [] = fk_coord_plot(theta0, theta1, theta2, theta3, theta4)

    l0 = 14.2;
    l1 = 1.8;
    l2 = 14.5;
    l4 = 29.5;
    
    %Individual homogenous transformation matrices
    a = [cos(theta0) 0 sin(theta0) 0; sin(theta0) 0 -cos(theta0) 0; 0 1 0 l0; 0 0 0 1];
    b = [cos(theta1) 0 sin(theta1) 0; sin(theta1) 0 -cos(theta1) 0; 0 1 0 -l1; 0 0 0 1];
    c = [cos(theta2) 0 sin(theta2) 0; sin(theta2) 0 -cos(theta2) 0; 0 1 0 -l2; 0 0 0 1];
    d = [cos(theta3) 0 sin(theta3) 0; sin(theta3) 0 -cos(theta3) 0; 0 1 0 0; 0 0 0 1];
    e = [cos(theta4) 0 sin(theta4) 0; sin(theta4) 0 -cos(theta4) 0; 0 1 0 l4; 0 0 0 1];
    
    disp(a*b*c*d*e);
    
    [x0a, y0a, z0a] = map_coord([0, 0, 0]); %Initial Link 0 coordinate
    [x0b, y0b, z0b] = map_coord(get_coord(a));

    [x1b, y1b, z1b] = map_coord(get_coord(a*b));
    
    [x2b, y2b, z2b] = map_coord(get_coord(a*b*c));
    
    [x3b, y3b, z3b] = map_coord(get_coord(a*b*c*d));
    
    [x4b, y4b, z4b] = map_coord(get_coord(a*b*c*d*e));
    
    disp([x4b, y4b, z4b]);
    
    %Getting coordinates in required format
    x0 = [x0a x0b];
    y0 = [y0a y0b];
    z0 = [z0a z0b];
    
    x1 = [x0b x1b];
    y1 = [y0b y1b];
    z1 = [z0b z1b];
    
    x2 = [x1b x2b];
    y2 = [y1b y2b];
    z2 = [z1b z2b];
    
    x3 = [x2b x3b];
    y3 = [y2b y3b];
    z3 = [z2b z3b];
    
    x4 = [x3b x4b];
    y4 = [y3b y4b];
    z4 = [z3b z4b];
    
    %Plotting links
    hold on;
    
    plot3(x0, y0, z0, 'LineWidth', 2, 'Color', 'b');
    plot3(x1, y1, z1, 'LineWidth', 2, 'Color', 'b');
    plot3(x2, y2, z2, 'LineWidth', 2, 'Color', 'b');
    plot3(x3, y3, z3, 'LineWidth', 2, 'Color', 'b');
    plot3(x4, y4, z4, 'LineWidth', 2, 'Color', 'b');
    
    %Plotting joints
    plot3(x0b, y0b, z0b, '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x1b, y1b, z1b, '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x2b, y2b, z2b, '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x3b, y3b, z3b, '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x4b, y4b, z4b, '.', 'Color', 'r', 'MarkerSize', 10);
    
end
    
    
    
    
    
    
    