function [] = move_to_target_linear(target_a, target_b, n0, nf)

    %First check if both the solutions are valid
    t_a = ik_pseudo_inverse(target_a');
    t_b = ik_pseudo_inverse(target_b');
    
    % In this case, we assume that if the end points are valid then 
    % All linear points between them can be reached
    
    
    
    
    
    
    
    
end