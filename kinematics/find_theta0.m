function [ans1, ans2] = find_theta0(t, l0, l1)

[nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t);


ans1 = atan(py/px) + atan(-l1/sqrt(px*px + py*py - l1*l1));
ans2 = atan(py/px) + atan(l1/sqrt(px*px + py*py - l1*l1));