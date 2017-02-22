function [error] = calc_error(a, b)
    
    error = sqrt(sum((a-b).^2)/length(a));
    
end