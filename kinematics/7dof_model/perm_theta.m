function [p] = perm_theta(t, d)

    [t1, theta2, t3, t4] = find_theta(t, d);
    p = [t1(1) theta2 t4(1, 1) t3(1, 1);
         t1(1) theta2 t4(1, 1) t3(1, 2);
         t1(1) theta2 t4(1, 2) t3(1, 3);
         t1(1) theta2 t4(1, 2) t3(1, 4);
         t1(2) theta2 t4(2, 1) t3(2, 1);
         t1(2) theta2 t4(2, 1) t3(2, 2);
         t1(2) theta2 t4(2, 2) t3(2, 3);
         t1(2) theta2 t4(2, 2) t3(2, 4)];
    
end