%% clear the workspace
clc;close all; clearvars;
%% Create n random points
n = 20;
points = rand(2,n);
%% Display the cloud of points in [0,1]²
figure;
plot(points(1,:), points(2,:), '.');
axis equal; axis square;
title('Cloud of points');
axis([0 1 0 1]);
hold on;
%% Get the 2 most distant points and their distance
maximum = 0;
for i = 1:n
    for j = 1:n
        % Euclidean distance
        distance = sqrt( (points(1,i) - points(1,j))^2 + (points(2,i) - points(2,j))^2 );
        if distance >= maximum
            maximum = distance;
            ax = points(1,i);
            ay = points(2,i);
            bx = points(1,j);
            by = points(2,j);
        end
    end
end
%% Construction of  the circle of radius = maximum / 2
radius = maximum / 2;
% coordinate of the center : 
cx = (ax + bx)/2;
cy = (ay + by)/2;
%% Check if all the points are inside of this circle
for i = 1:n
    distanceFromCenter = sqrt( (cx - points(1,i))^2 + (cy - points(2,i))^2  );
    if distanceFromCenter > radius
        break;
    end
end
%% If all the points are in the circle plot the circle
if i == n
    centre = [cx cy];
    pos = [centre - radius 2 * radius 2 * radius];
    rectangle('Position',pos,'Curvature',[1 1]);
    axis equal;
end
