function [] = draw_initial(x0, y0, z0, x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4, x5, y5, z5)

    hold on;
    plot3(x0, y0, z0, 'LineWidth', 2, 'Color', 'b');
    plot3(x1, y1, z1, 'LineWidth', 2, 'Color', 'b');
    plot3(x2, y2, z2, 'LineWidth', 2, 'Color', 'b');
    plot3(x3, y3, z3, 'LineWidth', 2, 'Color', 'b');
    plot3(x4, y4, z4, 'LineWidth', 2, 'Color', 'b');
    plot3(x5, y5, z5, 'LineWidth', 2, 'Color', 'b');
    plot3(x0(2), y0(2), z0(2), '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x1(2), y1(2), z1(2), '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x2(2), y2(2), z2(2), '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x3(2), y3(2), z3(2), '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x4(2), y4(2), z4(2), '.', 'Color', 'r', 'MarkerSize', 10);
    plot3(x5(2), y5(2), z5(2), '.', 'Color', 'r', 'MarkerSize', 10);
end