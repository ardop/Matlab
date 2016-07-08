function [] = initialize_axes()

    xlabel('x');
    ylabel('y');
    zlabel('z');
    ax = gca;
    ax.XDir = 'reverse';
    ax.XLim = [0 100];
    ax.YDir = 'reverse';   
    ax.YLim = [0 100];
    ax.ZLim = [0 100];
    grid on;
    rotate3d on;
%     zoom on;
    
end