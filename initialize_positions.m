function[all_boids] = initialize_positions(grid_size, num_boids)

boid_struct = struct('pos', [1.0,1.0], 'vel', [0.1 0.1]);
all_boids(1:num_boids) = boid_struct;

for i=1: num_boids
    u= rand_range(-1,1);
    v= rand_range(-1,1);
    
    coin1 = rand();
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
    
    all_boids(i).pos = [x y];
    all_boids(i).vel = [u v];
end
end
    

