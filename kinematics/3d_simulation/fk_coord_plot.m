function [] = fk_coord_plot(theta)

    figure(1); %Draw on the same figure

    l0 = 14.2;
    l1 = 1.8;
    l2 = 14.5;
    l4 = 29.5;
    
    theta0 = theta(1);
    theta1 = theta(2);
    theta2 = theta(3);
    theta3 = theta(4);
    theta4 = theta(5);
    
    %Local coordinates of the end effector. Fork shape
    %Homogeneous coordinates
    efa = [-2 0 0 1]; %x y z
    efb = [2 0 0 1];
    efc = [-2 5 0 1];
    efd = [2 5 0 1];
    
    %Individual homogenous transformation matrices
    a = [cos(theta0) 0 sin(theta0) 0; sin(theta0) 0 -cos(theta0) 0; 0 1 0 l0; 0 0 0 1];
    b = [cos(theta1) 0 sin(theta1) 0; sin(theta1) 0 -cos(theta1) 0; 0 1 0 -l1; 0 0 0 1];
    c = [cos(theta2) 0 sin(theta2) 0; sin(theta2) 0 -cos(theta2) 0; 0 1 0 -l2; 0 0 0 1];
    d = [cos(theta3) 0 sin(theta3) 0; sin(theta3) 0 -cos(theta3) 0; 0 1 0 0; 0 0 0 1];
    e = [cos(theta4) 0 sin(theta4) 0; sin(theta4) 0 -cos(theta4) 0; 0 1 0 l4; 0 0 0 1];
    
    t = a*b*c*d*e;
    %Mapping from kinematic coordinates to matlab coordinates
    
    [x0a, y0a, z0a] = map_coord([0, 0, 0]); %Initial Link 0 coordinate
    [x0b, y0b, z0b] = map_coord(get_coord(a));

    [x1b, y1b, z1b] = map_coord(get_coord(a*b));
    
    [x2b, y2b, z2b] = map_coord(get_coord(a*b*c));
    
    [x3b, y3b, z3b] = map_coord(get_coord(a*b*c*d));
    
    [x4b, y4b, z4b] = map_coord(get_coord(a*b*c*d*e));
    
    %Coordinates in base coordinate frame
    
    [x5a, y5a, z5a] = map_coord(t*efa');
    [x5b, y5b, z5b] = map_coord(t*efb');
    [x6b, y6b, z6b] = map_coord(t*efc');
    [x7b, y7b, z7b] = map_coord(t*efd');
    
    
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
    
    %End effector lines
    
    x5 = [x5a x5b];
    y5 = [y5a y5b];
    z5 = [z5a z5b];
    
    x6 = [x5a x6b];
    y6 = [y5a y6b];
    z6 = [z5a z6b];
    
    x7 = [x5b x7b];
    y7 = [y5b y7b];
    z7 = [z5b z7b];
    
    %Plotting links
    hold on;
    %Clear axis for next fram
    cla;
    
    
    
    plot3(x0, y0, z0, 'LineWidth', 2, 'Color', 'b');
    plot3(x1, y1, z1, 'LineWidth', 2, 'Color', 'b');
    plot3(x2, y2, z2, 'LineWidth', 2, 'Color', 'b');
    plot3(x3, y3, z3, 'LineWidth', 2, 'Color', 'b');
    plot3(x4, y4, z4, 'LineWidth', 2, 'Color', 'b');
    plot3(x5, y5, z5, 'LineWidth', 2, 'Color', 'b');
    plot3(x6, y6, z6, 'LineWidth', 2, 'Color', 'b');
    plot3(x7, y7, z7, 'LineWidth', 2, 'Color', 'b');
    
    
    %Plotting joints
    plot3(x0b, y0b, z0b, '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x1b, y1b, z1b, '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x2b, y2b, z2b, '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x3b, y3b, z3b, '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x4b, y4b, z4b, '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x5a, y5a, z5a, '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x5b, y5b, z5b, '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x6b, y6b, z6b, '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x7b, y7b, z7b, '.', 'Color', 'r', 'MarkerSize', 10);
    

    
end
    
    
    
    
    
    
    