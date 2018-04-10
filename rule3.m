function return_velocity = rule3(u_vec, v_vec, num_boids, i)
% rule3(u_vec, v_vec, num_boids, i)
%
% calculate the update vector (velocity) to have boid i match the velocity
% of the vectors 
% 
% MANDATORY INPUTS: 
%   u_vec: vector of boid u velocities
%   v_vec: vector of boid v velocities  
%   num_boids: number of boids in our populations
%   i: boid being examined
%
% OUTPUTS: 
%   return_velocity: a vector of velocities based on matching boid i's
%   velocity to mean velocity of flock. 


percieved_velocity = zeros(2,1);

for j=1:num_boids
    if i ~= j
        percieved_velocity =  percieved_velocity + [u_vec(j); v_vec(j)];
    end
end
percieved_velocity = percieved_velocity./ num_boids -1  ; 

return_velocity = (percieved_velocity - [u_vec(i) ; v_vec(i)]) ./ 8 ; 
end