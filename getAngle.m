function [angle_bool] = getAngle(i_pos, j_pos, i_vel, fov_angle)
% returns a true boolean if bird j position is within the specified field
% of view

j_pos_new = j_pos - i_pos;

theta = acos( (dot(j_pos_new, i_vel)/ (norm(j_pos_new).* norm(i_vel)) ));

angle_bool = theta < ((2*pi - fov_angle)/ 2); 

end 

