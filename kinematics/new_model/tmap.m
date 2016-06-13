function [nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t)

nx = t(1, 1);
ny = t(2, 1);
nz = t(3, 1);

ox = t(1, 2);
oy = t(2, 2);
oz = t(3, 2);

ax = t(1, 3);
ay = t(2, 3);
az = t(3, 3);

px = t(1, 4);
py = t(2, 4);
pz = t(3, 4);


