function [x_vec, y_vec, u_vec, v_vec] = move_all_boids_to_new_positions(x_vec, y_vec, u_vec, v_vec, num_boids, fov_angle, predator)

v1 = zeros(2, 1);
v2 = zeros(2, 1);
v3 = zeros(2, 1);

velocity = [u_vec; v_vec];
position = [x_vec; y_vec];

for i=1:num_boids
    v1 = rule1(x_vec, y_vec, num_boids, i);
    v2 = rule2(x_vec, y_vec, u_vec, v_vec, num_boids, i, fov_angle); 
    v3 = rule3(u_vec, v_vec, num_boids, i); 
    
    velocity(:,i) = velocity(:,i) + (v1*predator) + v2 + v3; 
    position(:,i) = position(:,i) + velocity(:,i); 
    
end

x_vec = position(1,:);
y_vec = position(2,:); 

u_vec = velocity(1,:); 
v_vec = velocity(2,:); 