clear;
clc;

%%Create Scenario
%Create a UAV scenario and set its local origin
Scenario = uavScenario("UpdateRate",100,"ReferenceLocation",[0 0 0]);

%Add a marker to indicate the start pose of the UAV
addMesh(Scenario,"cylinder",{[0 0 1] [0 .01]},[0 1 0]);



%%Define UAV Platform
%Specify the initial position and orientation of the UAV in the north-east-down (NED) frame
InitialPosition = [0 0 -7];
InitialOrientation = [0 0 0];

%Create a UAV platform in the scenario
platUAV = uavPlatform("UAV",Scenario, ...
                      "ReferenceFrame","NED", ...
                      "InitialPosition",InitialPosition, ...
                      "InitialOrientation",eul2quat(InitialOrientation));

%Add a quadrotor mesh for visualization
updateMesh(platUAV,"quadrotor",{1.2},[0 0 1],eul2tform([0 0 pi]));



%%Create and Mount Sensor Model
%Specify the lidar resolution
AzimuthResolution = 0.5;      
ElevationResolution = 2;

%Specify the lidar range
MaxRange = 7;
AzimuthLimits = [-179 179];
ElevationLimits = [-15 15];

%Create a statistical sensor model to generate point clouds for 
% the lidar sensor
LidarModel = uavLidarPointCloudGenerator("UpdateRate",10, ...
                                         "MaxRange",MaxRange, ...
                                         "RangeAccuracy",5, ...
                                         "AzimuthResolution",AzimuthResolution, ...
                                         "ElevationResolution",ElevationResolution, ...
                                         "AzimuthLimits",AzimuthLimits, ...
                                         "ElevationLimits",ElevationLimits, ...                                       
                                         "HasOrganizedOutput",true);

%Create a lidar sensor and mount the sensor on the quadrotor
uavSensor("Lidar",platUAV,LidarModel, ...
          "MountingLocation",[0 0 -0.4], ...
          "MountingAngles",[0 0 180]);


%%obstacles
obstacles;



%%waypoints
waypoints;



%controller parameters
% Proportional Gains
Px = 8;
Py = 8;
Pz = 7.5;

% Derivative Gains
Dx = 1.5;
Dy = 1.5;
Dz = 2.5;

% Integral Gains
Ix = 0;
Iy = 0;
Iz = 5;

% Filter Coefficients
Nx = 1;
Ny = 5;
Nz = 14.4947065605712;


%%gravity
UAVSampleTime = 0.001;
Gravity = 9.81;
DroneMass = 0.1;



out = sim("ObstacleAvoidanceDemo.slx");
