function [] = move_to_theta_cubic(theta_a, theta_b, n0, nf, dq0, dqf)
    
    done = false; 
    
    %We first calculate the cubic equations for all 4 joint variables
    % An equation has the parameters a, b, c, d which form coefficients
    % of the cubic equation for that particular joint variable.
    % The equation taken here is an3 + bn2 + cn + d
    
    % iteration variable matrix
    A = [n0^3 n0^2 n0 1; 3*(n0^2) 2*n0 1 0; nf^3 nf^2 nf 1; 3*(nf^2) 2*nf 1 0];
    
    % joint variable matrix
    B = [theta_a(1:4); [dq0 dq0 dq0 dq0]; theta_b(1:4); [dqf dqf dqf dqf]];
    
    disp('B:');
    disp(B);
    
    disp('x:');
    x = inv(A)*B;
    
    disp(x);
    disp('----------------');
    disp('A*x:');
    disp(A*x);
    
    %Now that we have each of the cubic equations, the arm is moved
    
    for i=1:nf
        
        %For this particular iteration instant, we calculate
        %all joint variable values
        
        a = [i^3 i^2 i 1];
        theta_c = a*x;
        theta_c = [theta_c 0];
        fk_coord_plot(theta_c);
        pause(0.001);
    end

%     while ~done
%             theta_check = theta_a - theta_b;
%             %Rounding off to avoid errors
%             theta_a = round(theta_a, 2);
%             theta_b = round(theta_b, 2);
%             flag = 0;
%             for i=1:5
%                 %Updating angle at every time instance
%                 if theta_check(i)<0
%                     theta_a(i) = theta_a(i) + 0.01;
%                 elseif theta_check(i)>0
%                     theta_a(i) = theta_a(i) - 0.01;
%                 else
%                     flag = flag + 1;
%                 end
%             end
% 
%             %Plotting
%             fk_coord_plot(theta_a);
%             %Pause required for animation
%             pause(0.01);
% 
%             %Checking equality using threshold to avoid
%             %Matlab equality errors
%             if sum(abs(theta_a - theta_b))<0.001
%                 done = true;
%             end
%             
%             if flag==5
%                 done = true;
%             end
% 
%     end
end