function main(options)
%
%
% initialize positions randomly
all_boids = initialize_positions(options.grid_size, options.num_boids);

% loop to draw boids and move boids to new positions
draw_boids(all_boids)