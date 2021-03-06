function[all_boids] = initialize_positions(grid_size, num_boids)
%
%[all_boids] = initialize_positions(grid_size, num_boids)
% 
%INPUTS
%   grid_size: size of one axis of the visible grid
%   num_boids: number of boids in our model
%
%OUTPUTS
%   all_boids: structure with each boid as key and values are position and
%               velocity
%
%Authors: Andy Metcalf and Josh Minot
%
%Initialize the structure
boid_struct = struct('pos', [1.0,1.0], 'vel', [0.1 0.1]);
all_boids(1:num_boids) = boid_struct;

%Initialize boids so that they start off the screen
for i=1: num_boids
    u= rand_range(-1,1);  %velocies between -1 and 1
    v= rand_range(-1,1);
    
    coin1 = rand();   %coin flip to alternate top-bottom / left-right
    coin2 = rand();
    
    bool1 = coin1<0.5;
    bool2 = coin2<0.5;
    
    x = rand_range(grid_size/2, grid_size);
    y = rand_range(grid_size/2, grid_size);
    
    if bool1
        x = -x;
    end
    if bool2
        y = -y;
    end
    
    %assign
    all_boids(i).pos = [x y];
    all_boids(i).vel = [u v];
end
end
    

