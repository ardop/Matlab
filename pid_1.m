final_angle = 180;
dt = 0.15;

kd = 0.01;
ki = 0.4;
kp = 0.01;

pos = 0;

diff_error = 0;
int_error = 0;
error = 0;
error_old = 0;

t = [0:1:100];
x = [];

for i=0:100
    error = final_angle - pos;
    diff_error = (error - error_old)/dt;
    error_old = error;
    
    int_error = int_error + (error*dt);
    
 
    pos = kp*error + kd*diff_error + ki*int_error;

    x = [x pos];
    disp(pos);
end;

figure
plot(t, x);
    

