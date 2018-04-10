function v1 = rule1(x_vec, y_vec, num_boids, i)
% rule1(x_vec, y_vec, num_boids, i)
%
% calculate direction of boid population center of mass, relative to boid
% i, and create velocity to move torward center of mass
%
% MANDATORY INPUTS: 
%   x_vec: vector of boid x positions 
%   y_vec: vector of boid y positions   
%   num_boids: number of boids in our populations 
%   i: the index of the boid the rule is being calculated for
% 
% OUTPUTS: 
%   v1: boid position update vector (velocity) based on center of mass rule

% AUTHORS: ANDY METCALF and JOSH MINOT 

% preallocate vector for velocity array
percieved_center = zeros(2,1);

% iterate through boid population 
for j=1:num_boids
    if j ~= i
        j_vec = [x_vec(j); y_vec(j)];
        percieved_center = percieved_center + j_vec;
    end 
end
percieved_center = percieved_center./(num_boids-1);

% for 1 % movement 
v1 = ((percieved_center  - [x_vec(i); y_vec(i)]) ./ 100);

