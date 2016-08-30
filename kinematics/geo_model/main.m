clear;
clc;

%length of the arms
l2 = 14.5;
l4 = 29.5;

in = input('Enter the 3 coordinates: \n', 's');
theta = str2double(strsplit(in));
theta = round(theta, 2);

%Mapping
[x, y, z] = coord_map(theta);

%Finding y'
yy = sqrt(z*z + y*y);

%alpha1
% [alpha11, alpha12] = find_flat_alpha1(x, l2);
[alpha11, alpha12] = find_alpha1(x, yy, l2, l4);

%alpha2
alpha21 = find_alpha2(x, yy, l2, alpha11);
alpha22 = find_alpha2(x, yy, l2, alpha12);

%alpha3
alpha3 = atan2(z, y);






