function c = rule2(x_vec, y_vec, u_vec, v_vec, num_boids, i, fov_angle)
% rule2(x_vec, y_vec, u_vec, v_vec, num_boids, i, fov_angle)
% 
% apply the minimum distance and field of view rules, then return vecolcity
% vector of this rule 
%
% MANDATORY INPUTS:
%   x_vec: vector of boid x positions 
%   y_vec: vector of boid y positions 
%   u_vec: vector of boid u velocities
%   v_vec: vector of boid v velocities  
%   num_boids: number of boids in our populations 
%   i: the index of the boid the rule is being calculated for
%   fov_angle: the field of view angle in radians 
%   
% OUTPUT: 
%   c: a 2-d update vector (velocity) for boid i, based on rule 2

% AUTHORS: Andy Metcalf and Josh Minot

% Preallocate update vector for boid i 
c = zeros(2, 1);

% iterate through all other (not i) boids 
for j=1:num_boids
    % check if boid i
    if j ~= i
        % convert 1-d position and velocity vectors to 2-d for calculations
        i_pos = [x_vec(i); y_vec(i)];
        j_pos = [x_vec(j); y_vec(j)];
        i_vel = [u_vec(i); v_vec(i)];
        % check if boid j is within 100 units of boid i
        if (abs(norm(i_pos - j_pos)) < 100)
            % calculate the angle of the other bird for field of view
            if getAngle(i_pos, j_pos, i_vel, fov_angle)
                % get new position for moving boid i away from j 
                c = c - (i_pos - j_pos); 
            end
        end
    end
end

end