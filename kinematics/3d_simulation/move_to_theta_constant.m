function [] = move_to_theta_constant(theta_a, theta_b, n0, n1, n2, nf, dqc)
    
    %We have 3 separate equations
    %The first equation is for the motion from rest to the constant 
    %Velocity. As it has 3 constraints, we use a quadratic equation. 
    
    %The second equation is for the continuous motion with constant
    %Velocity. Having a single constraint, a linear equation is used.
    
    %The third equation is for the motion from constant velocity to 
    %rest. Having four constraint equations, a cubic equation is used.
 
    %First we compute parameters for the quadratic equation
    
    %Iteration variable matrix
    A1 = [n0^2 n0 1; 2*n0 1 0; 2*n1 1 0];
    
    %Joint variable matrix
    B1 = [theta_a(1:4); [0 0 0 0]; [dqc dqc dqc dqc]];
    
    %Equation parameters
    x1 = A1\B1; %inv(A1)*B1
    
    disp('B1:');
    disp(B1);
    
    disp('x1:');
    disp(x1);
    
    disp('----------------');
    disp('A1*x1:');
    disp(A1*x1);
    disp('----------------');
    
    %Now we calculate parameters for the linear equation
    %The equation is of the form q(n) = dqc*n + c1
    %Where c1 can be computed from boundary conditions
    %c1 = a*n1*n1 + b*n1 + c - dqc*n1
    
    %First we calculate c1
    
    c1 = [n1^2 n1 1]*x1;
    c1 = c1 - (dqc*n1);
    
    %Parameters of the linear equations are dqc and c1
    x2 = [[dqc dqc dqc dqc]; c1];
    
    
    %Now we compute the parameters of the cubic equation
    A3 = [nf^3 nf^2 nf 1; 3*(nf^2) 2*nf 1 0; n2^3 n2^2 n2 1; 3*(n2^2) 2*n2 1 0];
    
    % Third condition where the boundaries of the second and third
    % equations overlap (at t2)
    tmp = [n2 1]*x2;
    
    B3 = [theta_b(1:4); [0 0 0 0]; tmp; [dqc dqc dqc dqc]];
    
    %Compute parameters
    x3 = A3\B3;
    
    disp('B3:');
    disp(B3);
    
    disp('x3:');
    disp(x3);
    
    disp('----------------');
    disp('A3*x3:');
    disp(A3*x3);
    disp('----------------');
    
    %The arm is moved in 3 phases
    
    %First the rest to constant velocity phase
    for i=n0:n1
        
        a = [i^2 i 1];
        theta_c = a*x1;
        theta_c = [theta_c 0];
        fk_coord_plot(theta_c);
        pause(0.001);
    end
    
    %Next the constant velocity phase
    for i=n1:n2
        
        a = [i 1];
        theta_c = a*x2;
        theta_c = [theta_c 0];
        fk_coord_plot(theta_c);
        pause(0.001);
    end
    
    %Next the constant velocity to rest phase
    for i=n2:nf
        
        a = [i^3 i^2 i 1];
        theta_c = a*x3;
        theta_c = [theta_c 0];
        fk_coord_plot(theta_c);
        pause(0.001);
    end
    
    

  
end