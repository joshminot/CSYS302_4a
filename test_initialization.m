function [all_boids] = test_initialization(grid_size, num_boids )

boid_struct = struct('pos', [1.0,1.0], 'vel', [0.1 0.1]);
all_boids(1:num_boids) = boid_struct;

all_boids(1).pos = [0 0];
all_boids(1).vel = [1 0]; 

for i=2: num_boids
    u= rand_range(-1,1);
    v= rand_range(-1,1);
    
    x = rand_range((grid_size/2)*-1, (grid_size)/2);
    y = rand_range((grid_size/2)*-1, (grid_size)/2);
    
    all_boids(i).pos = [x y];
    all_boids(i).vel = [u v];
end