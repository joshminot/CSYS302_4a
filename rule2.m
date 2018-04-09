function c = rule2(x_vec, y_vec, u_vec, v_vec, num_boids, i, fov_angle)

c = zeros(2, 1);

for j=1:num_boids
    if j ~= i
        i_pos = [x_vec(i); y_vec(i)];
        j_pos = [x_vec(j); y_vec(j)];
        i_vel = [u_vec(i); v_vec(i)];
        if (abs(norm(i_pos - j_pos)) < 100)
            % calculate the angle of the other bird for field of view
            if getAngle(i_pos, j_pos, i_vel, fov_angle)
                c = c - (i_pos - j_pos); 
            end
        end
    end
end

end