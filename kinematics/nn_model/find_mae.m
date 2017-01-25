function mae = find_mae(actual, predicted)

    e = abs((abs(actual - predicted))./actual)*100;
    
    m = size(e, 1);
    n = size(e, 2);
    
    mae = sum(sum(e))/(m*n);
    
end