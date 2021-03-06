function [all_boids] = test_initialization(grid_size, num_boids )
%
% test_initialization(grid_size, num_boids )
%
% INPUT
%   grid_size: dimension of one side of grid
%   num_boids: number of boids in the simulation
%
% OUTPUT
%   all_boids: structure keyed by the individual boids containing postion
%               and velocity
%
% Authors: Andy Metcalf and Josh Minot

%initialize the structure
boid_struct = struct('pos', [1.0,1.0], 'vel', [0.1 0.1]);
all_boids(1:num_boids) = boid_struct;

%initialize the first boid that will be at the origin
all_boids(1).pos = [0 0];
all_boids(1).vel = [1 0]; 

%initialize the other boids outside of the center
for i=2: num_boids
    %rand_range is a funtion that returns a number within specified range
    u= rand_range(-1,1);
    v= rand_range(-1,1);
    
    x = rand_range((grid_size/2)*-1, (grid_size)/2);
    y = rand_range((grid_size/2)*-1, (grid_size)/2);
    
    all_boids(i).pos = [x y];
    all_boids(i).vel = [u v];
end