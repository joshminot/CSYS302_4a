function v1 = rule1(x_vec, y_vec, num_boids, i)

percieved_center = zeros(2,1);


for j=1:num_boids
    if j ~= i
        j_vec = [x_vec(j); y_vec(j)];
        percieved_center = percieved_center + j_vec;
    end 
end
percieved_center = percieved_center./(num_boids-1);

% for 1 % movement 
v1 = ((percieved_center  - [x_vec(i); y_vec(i)]) ./ 100);

