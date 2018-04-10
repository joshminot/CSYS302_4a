function [angle_bool] = getAngle(i_pos, j_pos, i_vel, fov_angle)
% getAngle(i_pos, j_pos, i_vel, fov_angle)
%
% return TRUE (1) if boid j is within the field of view (defined as fov_angle) if
% boid i, otherwise return FALSE (0)
% 
% MANDATORY INPUTS: 
%   i_pos: 2-d array of boid i position
%   j_pos: 2-d array of boid j position
%   i_vel: 2-d array of boid i velocity 
%   fov_angle: angle of boid i field of view, in radians
%
% OUTPUTS: 
%   angle_bool: true if boid j is within the field of view of boid i

% AUTHORS: Andy Metcalf and Josh Minot 

% get difference in positions to reset orogin of boid j position vector
j_pos_new = j_pos - i_pos;

theta = acos( (dot(j_pos_new, i_vel)/ (norm(j_pos_new).* norm(i_vel)) ));

% compare the angle to the fov_angle
angle_bool = theta < ((2*pi - fov_angle)/ 2); 

end 

