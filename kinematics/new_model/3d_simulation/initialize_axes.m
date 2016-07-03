function [] = initialize_axes(ax)

    ax.XDir = 'reverse';
    ax.XLim = [0 40];
    ax.YDir = 'reverse';   
    ax.YLim = [0 40];
    ax.ZLim = [0 60];
    grid on;
    rotate3d on;
%     zoom on;
    
end