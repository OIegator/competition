function [newPopulation] = updatePositions(population)
    speed = 1;
    awake = find((population(:,5) ~= 3) & (population(:,6) == 0) & (population(:,5) ~= 1));
    [n, ~] = size(awake);
    for i = 1:n
        p = population(awake(i),:); 
        if (p(1) == p(3) && p(2) == p(4))
            p(3) = randi([0, 1000]);
            p(4) = randi([0, 1000]);
        end
        p(1) = p(1) + speed*sign(p(3) - p(1));
        p(2) = p(2) + speed*sign(p(4) - p(2));
        population(awake(i),:) = p;
    end
    newPopulation = population;
end

