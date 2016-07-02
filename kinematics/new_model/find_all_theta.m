function [perm_theta] = find_all_theta(t, l0, l1, l2, l4)

    %Values of theta0
    [theta0a, theta0b] = find_theta0(t, l1, l4);
    
    theta0 = [theta0a, theta0b];
    
    %Values of theta1
    [theta1a1, theta1a2] = find_new_theta1(t, theta0a, l4);
    [theta1b1, theta1b2] = find_new_theta1(t, theta0b, l4);
    
    theta1 = [theta1a1, theta1a2, theta1b1, theta1b2];
    
    %Values of theta2
    theta2 = [];
    for i=1:length(theta0)
        for j=1:length(theta1)
            [theta2a, theta2b] = find_new_theta2(t, theta0(i), theta1(j));
            theta2 = [theta2, theta2a, theta2b];
        end
    end
    
    %Values of theta4
    theta4 = [];
    for i=1:length(theta0)
        for j=1:length(theta1)
            [theta4a, theta4b] = find_new_theta4(t, theta0(i), theta1(j));
            theta4 = [theta4, theta4a, theta4b];
        end
    end
    
    %Values of theta3
    theta3 = [];
    for i=1:length(theta0)
        for j=1:length(theta1)
            for k=1:length(theta2)
                [theta3a, theta3b] = find_new_theta3(t, theta0(i), theta1(j), theta2(k));
                theta3 = [theta3, theta3a, theta3b];
            end
        end
    end
    
    perm_theta = [];
    
    for i=1:length(theta0)
        for j=1:length(theta1)
            for k=1:length(theta2)
                for l=1:length(theta3)
                    for m=1:length(theta4)
                        perm_theta = [perm_theta; [theta0(i) theta1(j) theta2(k) theta3(l) theta4(m)]];
                    end
                end
            end
        end
    end
    
end
    
    