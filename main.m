function main(options)
%
%
% initialize positions randomly

all_boids = initialize_positions(options.grid_size, options.num_boids);

% loop to draw boids and move boids to new positions
num_boids = options.num_boids;

x_vec = zeros(num_boids, 1);

y_vec = zeros(num_boids, 1);

u_vec = zeros(num_boids, 1);

v_vec = zeros(num_boids, 1); 

for rep=1:options.num_its
    [x_vec, y_vec, u_vec, v_vec] = draw_boids(all_boids);
    
    [x_vec, y_vec, u_vec, v_vec] = move_all_boids_to_new_positions(x_vec, y_vec, u_vec, v_vec, num_boids); 
    
end

end 