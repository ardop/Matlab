function [ans1, ans2] = find_theta1(t, l0, l1)

[nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t);

[theta01, theta02] = find_theta0(t, l0, l1);

ans1 = atan((px*cos(theta01)+py*sin(theta01))/(l0-pz));
ans2 = atan((px*cos(theta02)+py*sin(theta02))/(l0-pz));