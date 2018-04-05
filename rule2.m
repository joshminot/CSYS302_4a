function c = rule2(x_vec, y_vec, num_boids, i)

c = zeros(2, 1);

for j=1:num_boids
    if j ~= i
        i_pos = [x_vec(i); y_vec(i)];
        j_pos = [x_vec(j); y_vec(j)];
        if (abs(norm(i_pos - j_pos)) < 100)
            c = c - (i_pos - j_pos); 
        end
    end
end

end