function [valid_theta] = validate_theta(perm_theta, epsilon0, epsilon1, alpha1)

    %Checking if the theta angles are valid
    t1=0;t2=0;t3=0;t4=0;
    valid_theta = [];
    
    
    for i=1:size(perm_theta, 1)
        t = num2cell(perm_theta(i,:));
        [theta1, theta2, theta3, theta4] = deal(t{:});
        
        if((theta1<=epsilon0) && (theta1>=-(pi-epsilon0)))
            t1 = 1;
        end
        if((theta2<=pi+epsilon1) && (theta2>=-alpha1))
            t2 = 1;
        end
        if((theta3<=pi/2) && (theta3>=-pi/2))
            t3 = 1;
        end
        if((theta4<=0) && (theta4>=-pi/2))
            t4 = 1;
        end

        
        if((t1+t2+t3+t4)==4)
            valid_theta = [valid_theta; perm_theta(i, :)];
        end
    end
end
        
        
        
    

    
    