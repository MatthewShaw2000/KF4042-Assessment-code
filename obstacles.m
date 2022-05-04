%%Obstacles
%Add cuboid obstacles, representing buildings, to the scenario
% Locations of the obstacles
ObstaclePositions = [10 5; 20 0; 35 5; 25 10; 25 20; 20 25; 15 30; 10 25]; 
%ObstaclePositions = [5 5; 25 5; 10 10; 25 15; 35 15; 30 25; 20 25; 10 30];
%ObstaclePositions = [5 25; 10 20; 10 30; 15 25; 20 30; 25 15; 25 25; 30 20];
%ObstaclePositions = [5 15; 10 10; 10 20; 15 5; 15 25; 20 10; 20 20; 25 15];
%ObstaclePositions = [5 5; 10 0; 15 10; 20 0; 25 5; 25 20; 30 10; 35 5];


for i = 1:size(ObstaclePositions,1)
    % Height of the obstacles
    ObstacleHeight = randi(15); 

    % Width of the obstacles
    ObstaclesWidth = randi(6);

    addMesh(Scenario,"polygon", ...
        {[ObstaclePositions(i,1)-ObstaclesWidth/2 ObstaclePositions(i,2)-ObstaclesWidth/2; ...
        ObstaclePositions(i,1)+ObstaclesWidth/2 ObstaclePositions(i,2)-ObstaclesWidth/2; ...
        ObstaclePositions(i,1)+ObstaclesWidth/2 ObstaclePositions(i,2)+ObstaclesWidth/2; ...
        ObstaclePositions(i,1)-ObstaclesWidth/2 ObstaclePositions(i,2)+ObstaclesWidth/2], ...
        [0 ObstacleHeight]},0.651*ones(1,3));
end

show3D(Scenario);
legend("Start Position","Obstacles");