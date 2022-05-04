%%waypoints
%Specify the waypoints for the UAV
Waypoints = [InitialPosition; 0 30 -7; 15 15 -7; 30 30 -7; 30 0 -7];

%Add markers to indicate the waypoints
for i = 2:size(Waypoints,1)
    addMesh(Scenario,"cylinder",{[Waypoints(i,2) Waypoints(i,1) 1] [0 0.1]},[1 0 0]);
end
show3D(Scenario);
hold on
plot3([InitialPosition(1,2); Waypoints(:,2)],[InitialPosition(1,2); Waypoints(:,1)],[-InitialPosition(1,3); -Waypoints(:,3)],"-g")
legend(["Start Position","Obstacles","","","Waypoints","","","Direct Path"]);