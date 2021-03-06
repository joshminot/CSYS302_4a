function main(options)
% main(options) -- main function to make the calls for Boids swarm
% simulation
%
%INPUT
%   OPTIONS: structure with the following
%       'num_boids': the number of boids
%       'num_its': the number of simulation iterations
%       'fov_angle': field of vision angle; this is the angle that the bird
%                   cannot see
%       'test_bool': boolean indicating whether or not to test FOV
%       'predator': -1 if predator is present, 1 if not
%
%OUTPUT
%   outputs the plots that are requested in the driver file
%
% Authors: Andy Metcalf and Josh Minot

%unpack our variables
grid_size = options.grid_size;
predator = options.predator;
num_boids = options.num_boids;
fov_angle = options.fov_angle;

%this is the piece that tests our FOV angle
if options.test_bool
    %call the test_initialization() function to return all_boids structure
    all_boids = test_initialization(grid_size,num_boids);
    %unpack velocity from the structure
    velocity = [all_boids(:).vel];
    %unpack components from the velocity vector
    u_vec = velocity(1:2:length(velocity)-1);
    v_vec = velocity(2:2:length(velocity));
    %unpack position from the structure
    position = [all_boids(:).pos];
    %unpack components from the position vector
    x_vec = position(1:2:length(position)-1);
    y_vec = position(2:2:length(position));
    
    % bool vec of seent'ness
    is_seen_vec = zeros(1,num_boids);
    
    %THIS LOOP STRUCTURE JUST CHECKS TO SEE WHICH BOIDS ARE IN FOV
    i = 1; 
    for j=1:num_boids
        if j ~= i
            i_pos = [x_vec(i); y_vec(i)];
            j_pos = [x_vec(j); y_vec(j)];
            i_vel = [u_vec(i); v_vec(i)];
            if (abs(norm(i_pos - j_pos)) < 100)
                % calculate the angle of the other bird for field of view
                if getAngle(i_pos, j_pos, i_vel, fov_angle)
                    is_seen_vec(j) = 1; 
                end
            end
        end
    end
    
    %get indices for plotting
    idx = find(is_seen_vec);
    id0 = find(is_seen_vec==0);
    
    %plot the boids
    scatter(x_vec(idx), y_vec(idx))
    hold on 
    scatter(x_vec(1), y_vec(1), 'MarkerFaceColor', 'r')
    scatter(x_vec(id0), y_vec(id0))
    %plot the lines for the FOV
    yval = getTheta(grid_size, fov_angle/2); 
    line([0 -grid_size], [0 yval]) 
    line([0 -grid_size], [0 -yval]) 
    %set the xlimits so everthing looks right
    xlim([-grid_size/2 grid_size/2])
    title({'FOV and Radius Test', ['FOV = ',num2str(fov_angle),' radians']})
    set(gca,'fontsize' ,16);
    
    
    return 
end



% RANDOM INITIALIZATION FOR BOIDS SIMULATION
all_boids = initialize_positions(options.grid_size, options.num_boids);
%unpack the velocity vector from the structure
velocity = [all_boids(:).vel];
%unpack the component vectors from the velocity vector
u_vec = velocity(1:2:length(velocity)-1);
v_vec = velocity(2:2:length(velocity));
%unpack the position vector from the structure
position = [all_boids(:).pos];
%unpack the component vectors from the position vector
x_vec = position(1:2:length(position)-1);
y_vec = position(2:2:length(position));

rep = 0;
[fighandle, plothandle] = plotMapInNewFigure(x_vec, y_vec, predator,rep); % PLOT INITIAL MAP (see function below)
saveas(gcf,'predFig0.png')


%loop to update simulation
for rep=1:options.num_its
    %update
    set(plothandle, 'XData', x_vec, 'YData', y_vec);
    drawnow;
    filename = ['predFig', num2str(rep),'.png'];
    if mod(rep,10) ==0
        title(gca,{'Boid Simulation',['iteration = ',num2str(rep)]});
        saveas(gcf,filename);
    end
    %the rules are all located in move_all_boids_to_new_positions()
    [x_vec, y_vec, u_vec, v_vec] = move_all_boids_to_new_positions(x_vec, y_vec, u_vec, v_vec, num_boids, fov_angle, predator); 
    
end

end 


%%% HELPER FUNCTION TO PLOT SIMULATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[fighandle, plothandle] =  plotMapInNewFigure(x_vec, y_vec, predator,rep)
%INPUT
%   x_vec: x component of position vector
%   y_vec: y component of position vector
%   predator: -1 if predator present and 1 if predator not present
fighandle=figure;
%load big bird image
img = imread('bigbird.jpeg'); 

hold on;  %# Add to the plot
%stick big bird in if we need a predator
if predator < 0  
    image([-1000 1000],[1000 -1000],img);
end
%plotting the points
plothandle = scatter(x_vec, y_vec);
%setting plot limits
set(gca,'XLim', [-10000 10000],'YLim',[-10000 10000]);
drawnow;
title({'Boid Simulation',['iteration = ',num2str(rep)]})
axis('square') %make sure aspect ratio is equal
set(gca, 'fontsize', 16);
end



%%%%% HELPER FUNCTION %%%%%%%%
function yval = getTheta(grid_size, theta)
%this function returns the y value of a right triangle with the adjacent
%side along the x_axis
%INPUT
%    gridsize: this is the x_value
%    theta: this is the angle
yval = tan(theta) *grid_size; 
end 

