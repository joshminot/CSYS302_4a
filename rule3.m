function return_velocity = rule3(u_vec, v_vec, num_boids, i)

percieved_velocity = zeros(2,1);

for j=1:num_boids
    if i ~= j
        percieved_velocity =  percieved_velocity + [u_vec(j); v_vec(j)];
    end
end
percieved_velocity = percieved_velocity./ num_boids -1  ; 

return_velocity = (percieved_velocity - [u_vec(i) ; v_vec(i)]) ./ 8 ; 
end