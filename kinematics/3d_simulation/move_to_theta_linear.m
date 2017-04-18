function [] = move_to_theta_linear(theta_a, theta_b, n0, nf)
    
    
    %We use linear equations as the only constraints are the end position
    %constraints
    
    % iteration variable matrix
    A = [n0 1; nf 1];
    
    % joint variable matrix
    B = [theta_a(1:4); theta_b(1:4)];
    
    disp('B:');
    disp(B);
    
    disp('x:');
    x = A\B; %(inv(A)*B)
    
    disp(x);
    disp('----------------');
    disp('A*x:');
    disp(A*x);
    disp('----------------');
    
    %Now that we have each of the cubic equations, the arm is moved
    
    for i=n0:nf
        
        %For this particular iteration instant, we calculate
        %all joint variable values
        
        a = [i 1];
        theta_c = a*x;
        theta_c = [theta_c 0];
        fk_coord_plot(theta_c);
        pause(0.01);
    end


end