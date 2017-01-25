function [ans1, ans2] = find_theta0(t, l1, l4)

[nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t);

num = -py + l4*oy;
den = px - l4*ox;
disp(num);
disp(den);

phi = atan(num/den);
disp(phi);

ans1 = -phi + atan(-l1/sqrt(num*num + den*den - l1*l1));
ans2 = -phi + atan(l1/sqrt(num*num + den*den - l1*l1));