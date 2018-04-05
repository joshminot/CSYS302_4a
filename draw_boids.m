function draw_boids(all_boids)

velocity = [all_boids(:).vel];
u_vec = velocity(1:2:length(velocity)-1);
v_vec = velocity(2:2:length(velocity));

position = [all_boids(:).pos];
x_vec = position(1:2:length(position)-1);
y_vec = position(2:2:length(position));

quiver(x_vec,y_vec, u_vec, v_vec)
