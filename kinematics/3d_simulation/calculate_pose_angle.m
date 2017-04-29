function [ret_theta5] = calculate_pose_angle(theta1, theta2, theta3, theta4, theta5)

    %Function to calculating the pose angle (theta5) to make the grippers
    %parallel to the ground for gripping of objects
    
    tmp = cos(theta1)*cos(theta2)*cos(theta3)*cos(theta4)*sin(theta5)-...
        cos(theta1)*cos(theta2)*sin(theta3)*cos(theta5)+...
        cos(theta1)*sin(theta2)*sin(theta4)*sin(theta5)+...
        sin(theta1)*sin(theta3)*cos(theta4)*sin(theta5)+...
        sin(theta1)*cos(theta3)*cos(theta5);
    
    C1 = cos(theta1)*cos(theta2)*cos(theta3)*cos(theta4);
    C2 = cos(theta1)*cos(theta2)*sin(theta3);
    C3 = cos(theta1)*sin(theta2)*sin(theta4);
    C4 = sin(theta1)*sin(theta3)*cos(theta4);
    C5 = sin(theta1)*cos(theta3);
    
    A = C1 + C3 + C4;
    B = -C2 + C5;
    
    a13 = A*sin(theta5) + B*cos(theta5);
    
    %Calculating angle by equating a13 to zero
    
    theta5 = 1*pi - atan2(B, A);
    
    
    fprintf('Calculated angle:\n');
    disp(theta5);
    fprintf('----------------------\n');
    
    a13 = A*sin(theta5) + B*cos(theta5);
    
    fprintf('a13 with new angle:\n');
    disp(a13);
    fprintf('----------------------\n');
    
    %Modifying to keep the angle within limits
    
    
    if(theta5>=pi)
        theta5 = -(2*pi - theta5);
    end
    
    if(theta5<=-pi)
        theta5 = 2*pi + theta5;
    end
    
%     if(theta5<pi/2)
%         theta5 = theta5
    
    fprintf('Calculated angle after modification:\n');
    disp(theta5);
    fprintf('----------------------\n');
        
    
    a13 = A*sin(theta5) + B*cos(theta5);
    
    fprintf('a13 with new angle after modification:\n');
    disp(a13);
    fprintf('----------------------\n');
    
    ret_theta5 = theta5;
    
    

    
end