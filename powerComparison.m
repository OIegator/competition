function [newPowerDifference] = powerComparison(defaultPowerDifference,firstStatus, secondStatus)
    newPowerDifference = defaultPowerDifference;
    if (firstStatus == 1)
        newPowerDifference = 0;
    end
    if (firstStatus == 2)
        newPowerDifference = defaultPowerDifference - 0.3;
    end
    if (secondStatus == 1)
        newPowerDifference = 1;
    end
    if (secondStatus == 2)
        newPowerDifference = defaultPowerDifference + 0.3;
    end
end

