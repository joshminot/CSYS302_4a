%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% boidsDriver.m
% Makes calls to simulate Boids swarming model
%
%
% Authors: Andy Metcalf and Josh Minot
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all

%%
% PRODUCE GENERALIZED SWARMING BEHAVIOR

% landscape grid size of grid_size x grid_size
grid_size = 400;
% number of boids in simulation
num_boids = 200;
% number of iterations
num_its = 100;
% field of view angle; this is the angle that the boid cannot see behind it
fov_angle = pi/4; 
test_bool = 0;
% -1 indicated presence of predator, because predation is bad, m'kay? 
predator = 1;

% insert into structure for ease of calling main() function
options = struct('grid_size', grid_size,...
                'num_boids', num_boids,...
                'num_its', num_its,...
                'fov_angle', fov_angle,...
                 'test_bool', test_bool,...
                'predator', predator);
main(options)


%%
% THIS SIMULATES A PREDATOR.  WATCH OUT FOR BIG BIRD!!! 
grid_size = 400;
num_boids = 200;
num_its = 100;
fov_angle = pi/4; 
test_bool = 0;
% -1 indicated presence of predator, because predation is bad, m'kay? 
predator = -1;

options = struct('grid_size', grid_size,...
                'num_boids', num_boids,...
                'num_its', num_its,...
                'fov_angle', fov_angle,...
                 'test_bool', test_bool,...
                'predator', predator);
main(options)


%%
% FIELD OF VIEW DEMONSTRATION
% simply demonstrates that our field of view works

grid_size = 400;
num_boids = 200;
num_its = 500;
fov_angle = pi/4; 
test_bool = 1;
% -1 indicated presence of predator, because predation is bad, m'kay? 
predator = -1;

options = struct('grid_size', grid_size,...
                'num_boids', num_boids,...
                'num_its', num_its,...
                'fov_angle', fov_angle,...
                 'test_bool', test_bool,...
                'predator', predator);
main(options)

