grid_size = 40;
num_boids = 100;

options = struct('grid_size', grid_size,...
                'num_boids', num_boids);
main(options)

% %simple quiverplot example
% x = [1 12];
% y = [1 2];
% u = [3 4];
% v = [4 6];
% quiver(x,y,u,v)
% 
%creates grid points in the xy-plane
% [x y] = meshgrid(0:1:20, -1:1:12);
% 
% slope = y
% 
% quiver(x,y, ones(size(x)), slope)

