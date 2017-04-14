function [theta_a] = move_to_target(target, theta_a)

    theta_b = ik_pseudo_inverse(target');
    theta_b = theta_b';

    if theta_b~=-1

        move_to_theta(theta_a, theta_b);

    else

        fprintf('No Solution\n\n');

    end
    
    theta_a = theta_b;