function [result] = runSimulation(totalAnimals, simulationLength,...
    powerDifference, pastureRate, deathRate, shelterRate, starvationRate, ...
    fieldOfView, numberOfEnemies)

% Each animal has 7 params:
% 4 coords - current location (x,y) and destination (x,y)
% Status code:
% 0 - hunting, 1 - sleepy, 2 - hungry, 3 - dead
% Behaviuor code: 0 - in hunting, 1 - taking a nap, or sitting in shelter
% Animal type: 0 - first type of animal, 1 - second type of animal

animals = zeros(totalAnimals, 7);
animals(:,1:4) = randi([0, 1000], [totalAnimals, 4]);
animals(1,5) = 1;
for i = 1:totalAnimals
  animals(i,6) = rand < shelterRate;
  if (rand < starvationRate)
    animals(i,5) = 2;
  end
  if (i <= numberOfEnemies)
      animals(i,7) = 0;
  else
      animals(i,7) = 1;
  end
end
%video = VideoWriter('output');
%video.FrameRate = 30;
%open(video);
for i = 1:simulationLength
  frame = drawPopulation(animals);
  %writeVideo(video, frame);
  animals = updatePositions(animals);
  animals = combatResult(animals, powerDifference, fieldOfView);
  animals = updateStarvation(animals, pastureRate, deathRate);
end
%close(video);
result = [sprintf('First type: stil in hunting - %d\n', nnz(animals(animals(:,5)==0 & animals(:,7)==0))),...
        sprintf('First type: still starving - %d\n', nnz(animals(animals(:,5)==2 & animals(:,7)==0))),...
        sprintf('First type: full and sleepy - %d\n', nnz(animals(animals(:,5)==1 & animals(:,7)==0))),...
        sprintf('First type: dead - %d\n', nnz(animals(animals(:,5)==3 & animals(:,7)==0))),...
        sprintf('Second type: stil in hunting - %d\n', nnz(animals(animals(:,5)==0 & animals(:,7)==1))),...
        sprintf('Second type: still starving - %d\n', nnz(animals(animals(:,5)==2 & animals(:,7)==1))),...
        sprintf('Second type: full and sleepy - %d\n', nnz(animals(animals(:,5)==1 & animals(:,7)==1))),...
        sprintf('Second type: dead - %d\n', nnz(animals(animals(:,5)==3 & animals(:,7)==1)))];
end