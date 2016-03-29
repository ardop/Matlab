function [ans1, ans2] = find_theta2(t, l0, l1)

[nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t);

[theta01, theta02] = find_theta0(t, l0, l1);
[theta11, theta12] = find_theta1(t, l0, l1);

ans1 = atan(oz/(sin(theta11)*(oy*cos(theta01)-ox*sin(theta01))));
ans2 = atan(oz/(sin(theta12)*(oy*cos(theta02)-ox*sin(theta02))));