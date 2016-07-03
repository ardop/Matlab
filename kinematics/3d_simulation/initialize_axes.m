function [] = initialize_axes()

    xlabel('x');
    ylabel('y');
    zlabel('z');
    ax = gca;
    ax.XDir = 'reverse';
    ax.XLim = [0 80];
    ax.YDir = 'reverse';   
    ax.YLim = [0 60];
    ax.ZLim = [0 60];
    grid on;
    rotate3d on;
%     zoom on;
    
end