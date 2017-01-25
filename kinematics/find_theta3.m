function [ans1, ans2] = find_theta3(t, l0, l1)

[nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t);

[theta01, theta02] = find_theta0(t, l0, l1);

ans1 = atan((ax*sin(theta01)-ay*cos(theta01))/(nx*sin(theta01)-ny*cos(theta01)));
ans2 = atan((ax*sin(theta02)-ay*cos(theta02))/(nx*sin(theta02)-ny*cos(theta02)));