function [x_vec, y_vec, u_vec, v_vec] = move_all_boids_to_new_positions(x_vec, y_vec, u_vec, v_vec, num_boids, fov_angle, predator)
% move_all_boids_to_new_positions(x_vec, y_vec, u_vec, v_vec, num_boids, fov_angle, predator)
% 
% Calculate boid velocity vectors based on rule functions and apply updates
% to the entire population position vectors 
% 
% MANDATORY INPUTS:
%   x_vec: vector of boid x positions 
%   y_vec: vector of boid y positions 
%   u_vec: vector of boid u velocities
%   v_vec: vector of boid v velocities  
%   num_boids: number of boids in our populations 
%   fov_angle: the field of view angle in radians 
%   predator: specify predator, either 1 or -1: 
%           1: no predator 
%           -1: predator 
%
% OUTPUTS: 
%   updated position vectors (post application of rules):
%       x_vec: vector of boid x positions 
%       y_vec: vector of boid y positions 
%       u_vec: vector of boid u velocities
%       v_vec: vector of boid v velocities 


% AUTHORS: Andy Metcalf and Josh Minot


% preallocate velocity arrays 
v1 = zeros(2, 1);
v2 = zeros(2, 1);
v3 = zeros(2, 1);

% combine 1-d vecolcity and positions arrays into single 2-d arrays
velocity = [u_vec; v_vec];
position = [x_vec; y_vec];

% loop through each bird and calculate update vectors(velocity) based on 
% rules and then apply udpates to the bird positions 
for i=1:num_boids
    v1 = rule1(x_vec, y_vec, num_boids, i);
    v2 = rule2(x_vec, y_vec, u_vec, v_vec, num_boids, i, fov_angle); 
    v3 = rule3(u_vec, v_vec, num_boids, i); 
    
    velocity(:,i) = velocity(:,i) + (v1*predator) + v2 + v3; 
    position(:,i) = position(:,i) + velocity(:,i); 
    
end

% return vectors in our standardized 1-d format 
x_vec = position(1,:);
y_vec = position(2,:); 

u_vec = velocity(1,:); 
v_vec = velocity(2,:); 