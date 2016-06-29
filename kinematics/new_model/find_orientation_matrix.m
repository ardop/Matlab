clc;

%Global coordinate rotation for left arm in initial position
qz1 = global_rotation('z', -pi/2);
qy = global_rotation('x', pi);
qz2 = global_rotation('z', pi);

% gqb = qz2*qy*qz1;

%Local coordinate rotation for left arm in initial position
az1 = local_rotation('z', -pi/2);
ay = local_rotation('y', pi);
az2 = local_rotation('z', pi);

% bag = az2*ay*az1;

%Global coordinate rotation for right arm in initial position
qz = global_rotation('z', pi/2);
gqb = qz;

%Local coordinate rotation for right arm in initial position
az = local_rotation('z', pi/2);
bag = az;