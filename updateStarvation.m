function [newPopulation] = updateStarvation(population, pastureRate, deathRate)
    hungry = find(population(:,5) == 2);
    [k,~] = size(hungry);
    for i = 1:k
        if (rand <= deathRate)
            population(hungry(i), 5) = 3;
        elseif (rand <= pastureRate)
            population(hungry(i), 5) = 2;
        end
    end
    newPopulation = population;
end

