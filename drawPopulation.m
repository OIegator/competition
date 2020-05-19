function [frame] = drawPopulation(population)
    cla;
    [n,~] = size(population);
    for i = 1:n
        p = population(i,:);
        color = getColor(p(5));
        if (p(7) == 1)
            plot(p(1), p(2), 'o', 'color', color, 'markerfacecolor', color);
        else
            plot(p(1), p(2), '*', 'color', color, 'markerfacecolor', color);
        end
        hold on
    end
    axis([-10, 1010, -10, 1010]);
    pause(1/100);
    frame = getframe(gcf);
end

