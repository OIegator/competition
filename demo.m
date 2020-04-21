clear all;
close all;
clc;

total_citizens = 100;
simulation_length = 100;
transmission_rate = 1;
recovery_rate = 0.01;
death_rate = 0.01;
isolation_rate = 0;
transmission_radius = 100;
% Each citizen has 6 params:
% 4 coords - current location (x,y) and destination (x,y)
% Status code:
% 0 - healthy, 1 - ill, 2 - recovered (immume), 3 - dead
% Behaviuor code: 0 - acts as usual, 1 - on self-isolation

citizens = zeros(total_citizens, 6);
citizens(:,1:4) = randi([0, 1000], [total_citizens, 4]);
citizens(1,5) = 1;
for i = 1:total_citizens
  citizens(i,6) = rand < isolation_rate;
end
video = VideoWriter('output');
video.FrameRate = 30;
open(video);
for i = 1:simulation_length
  frame = draw_population(citizens);
  writeVideo(video, frame);
  citizens = update_positions(citizens);
  citizens = update_status(citizens, transmission_rate, transmission_radius);
  citizens = update_recovery(citizens, recovery_rate, death_rate);
end
close(video);
sprintf('Never was ill: %d', nnz(citizens(citizens(:,5)==0)))
sprintf('Still ill: %d', nnz(citizens(citizens(:,5)==1)))
sprintf('Recovered: %d', nnz(citizens(citizens(:,5)==2)))
sprintf('Dead: %d', nnz(citizens(citizens(:,5)==3)))