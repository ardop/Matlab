%Kalman filter for a single state variable (sensor value)
%(Used for stereo camera depth estimation)

%Initializting initial variables

x_prev = 0; %Initial measured state. Set to any value
A = 1; %As the values are not dependent on time or other external factors.
B = 0; %The predicted value is the same as the measured value
u = 0; %No external control signal

Q = 1e-6; %Noise covariance matrix
P_prev = 10; %State covariance matrix
R = 25; %Measurement noise covariance matrix

x_next = 0; %Next iteration state variable
P_next = 0;
H = 1; 
I = 1; %identity

z = 30; %Measured state. Continuous get and update every iteration

while(true)
    
    x_next = A*x_prev + B*u;
    P_next = A*P_prev*(A') + Q;
    
    %Compute Kalman Gain
    K = (P_next*(H'))/(H*P_next*(H') + R);
    
    z = 28 + (32-28)*rand; %Makeshift measurement
    
    %Computing new state
    x_prev = x_next + K*(z - H*x_next);
    
    disp(x_prev);
    
    %Update covariance
    P_prev = (I - K*H)*P_next;
    
end
    
    
    
    
    
    
    
    
    
    
    
    
    
    