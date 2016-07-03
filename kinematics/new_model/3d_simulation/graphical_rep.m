clc;
figure();
[x0, y0, z0, x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4, x5, y5, z5] = get_init_params();
draw_initial(x0, y0, z0, x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4, x5, y5, z5);
xlabel('x');
ylabel('y');
zlabel('z');
ax = gca;
initialize_axes(ax);
