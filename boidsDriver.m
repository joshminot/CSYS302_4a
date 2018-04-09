clear all
close all

%%
% Gernalized swarming behavior 

grid_size = 400;
num_boids = 200;
num_its = 500;
fov_angle = pi/4; 
test_bool = 0;
% -1 indicated presence of predator, because predation is bad, m'kay? 
predator = 1;

options = struct('grid_size', grid_size,...
                'num_boids', num_boids,...
                'num_its', num_its,...
                'fov_angle', fov_angle,...
                 'test_bool', test_bool,...
                'predator', predator);
main(options)


%%
% Predator behavior 
grid_size = 400;
num_boids = 200;
num_its = 500;
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
% Field of view demonstration

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

