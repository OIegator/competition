function [newPopulation] = combatResult(population, powerDifference, fieldOfView)
    firstType = find((population(:,7) == 0) & (population(:,5) ~= 3));
    [k,~] = size(firstType);
    secondType = find((population(:,7) == 1) & (population(:,5) ~= 3)); 
    [m,~] = size(secondType);
    for i = 1:k
        p = population(firstType(i), :);
        for j = 1:m
            a = population(secondType(j), :);
            if (norm(p(1:2)-a(1:2)) < fieldOfView)
                if (rand <= powerComparison(powerDifference, p(5), a(5)))
                    a(5) = 3;
                    p(5) = 1;
                else
                    a(5) = 1;
                    p(5) = 3;
                end
                population(firstType(i), :) = p;
                population(secondType(j), :) = a;
            end
        end
    end
    newPopulation = population;
end

