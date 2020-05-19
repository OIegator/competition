clc;
close all;
clear all;

global totalAnimals simulationLength...
    powerDifference pastureRate deathRate shelterRate starvationRate ...
    fieldOfView numberOfEnemies result

totalAnimals = 100;
simulationLength = 10;
powerDifference = 0.5;
pastureRate = 0.01;
deathRate = 0.01;
shelterRate = 0.1;
starvationRate = 0.3;
fieldOfView = 50;
numberOfEnemies = 50;

f = figure('Visible', 'off', 'Position', [760, 500, 500, 800]);
leftUIPosition = 50;
startBtn = uicontrol('Style', 'pushbutton', 'String', ...
    'Start Simulation', 'Position', [leftUIPosition, 310, 400, 40], ...
    'Callback',{@startSimulationCallback});

uicontrol('Style', 'text', 'String', 'Number of animals',...
    'Position', [leftUIPosition, 260, 200, 40], ...
    'FontSize', 12);
uicontrol('Style', 'edit', 'String', totalAnimals, ...
    'Position', [250, 280, 200, 20], 'Callback',{@changeTotalAnimalsCallback});

uicontrol('Style', 'text', 'String', 'Power difference',...
    'Position', [leftUIPosition, 230, 200, 40], ...
    'FontSize', 12);
uicontrol('Style', 'edit', 'String', powerDifference, ...
    'Position', [250, 250, 200, 20], 'Callback',{@changePowerDifferenceCallback});

uicontrol('Style', 'text', 'String', 'Simulation length',...
    'Position', [leftUIPosition, 200, 200, 40], ...
    'FontSize', 12);
uicontrol('Style','slider','Max',100,'Min',0,'Value',simulationLength,...
    'SliderStep',[0.01 0.01],...
    'Position',[250, 220, 200, 20], 'Callback',{@changeSimulationLengthCallback});


result = uicontrol('Style', 'text', 'String', '',...
    'Position', [leftUIPosition, 50, 400, 150], ...
    'FontSize', 12);

ha = axes('Units', 'pixels', 'Position', [50, 380, 400, 400]);

set(f, 'Name', 'Disease Simulation');
movegui(f, 'center')
set(f, 'Visible', 'on');

function startSimulationCallback(~, ~)
    global totalAnimals simulationLength...
    powerDifference pastureRate deathRate shelterRate starvationRate ...
    fieldOfView numberOfEnemies result
   
    result.String = runSimulation(totalAnimals, simulationLength,...
        powerDifference, pastureRate, deathRate, shelterRate, starvationRate, ...
        fieldOfView, numberOfEnemies);
end

function changeTotalAnimalsCallback(source, ~)
    global totalAnimals
    valid = round(str2double(source.String));
    if isnan(valid) 
        warnfig = warndlg('Warning: invalid input!', 'Warning');
    end
    totalAnimals = round(str2double(source.String));
end

function changePowerDifferenceCallback(source, ~)
    global powerDifference
    valid = str2double(source.String);
    if isnan(valid) 
        warnfig = warndlg('Warning: invalid input!', 'Warning');
    end
    powerDifference = round(str2double(source.String));
end

function changeSimulationLengthCallback(source, ~)
    global simulationLength
    simulationLength = source.Value;
end

