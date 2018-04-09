function main(options)
%
%

gridSize = options.grid_size;
predator = options.predator;

if options.test_bool
    all_boids = test_initialization(options.grid_size, options.num_boids);
    
    num_boids = options.num_boids;

    fov_angle = options.fov_angle;

    velocity = [all_boids(:).vel];

    u_vec = velocity(1:2:length(velocity)-1);
    v_vec = velocity(2:2:length(velocity));

    position = [all_boids(:).pos];

    x_vec = position(1:2:length(position)-1);
    y_vec = position(2:2:length(position));
    
    % bool vec of seent'ness
    is_seen_vec = zeros(1,num_boids);
    
    
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
    
    idx = find(is_seen_vec);
    
    id0 = find(is_seen_vec==0);
    
    scatter(x_vec(idx), y_vec(idx))
    
    hold on 
    
    scatter(x_vec(1), y_vec(1), 'MarkerFaceColor', 'r')
    
    scatter(x_vec(id0), y_vec(id0))
    
    yval = getTheta(gridSize, fov_angle/2); 
    
    line([0 -gridSize], [0 yval]) 
   
    line([0 -gridSize], [0 -yval]) 
    
    xlim([-gridSize/2 gridSize/2])
    
    
    return 
end



% initialize positions randomly

all_boids = initialize_positions(options.grid_size, options.num_boids);


% unpacking variables
num_boids = options.num_boids;

fov_angle = options.fov_angle;

velocity = [all_boids(:).vel];

u_vec = velocity(1:2:length(velocity)-1);
v_vec = velocity(2:2:length(velocity));

position = [all_boids(:).pos];

x_vec = position(1:2:length(position)-1);
y_vec = position(2:2:length(position));


[fighandle, plothandle] = plotMapInNewFigure(x_vec, y_vec, predator); % PLOT INITIAL MAP (see function below)



for rep=1:options.num_its
%     draw_boids(x_vec, y_vec, u_vec, v_vec, @plotMapInNewFigure);
    
    set(plothandle, 'XData', x_vec, 'YData', y_vec);
    drawnow;
    [x_vec, y_vec, u_vec, v_vec] = move_all_boids_to_new_positions(x_vec, y_vec, u_vec, v_vec, num_boids, fov_angle, predator); 
    
end

end 


%%% HELPER FUNCTION TO PLOT MAP USING IMAGESC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[fighandle, plothandle] =  plotMapInNewFigure(x_vec, y_vec, predator)

fighandle=figure;


img = imread('bigbird.jpeg');             %# Load a sample image

hold on;  %# Add to the plot
if predator < 0
    image([-1000 1000],[1000 -1000],img);
end
plothandle = scatter(x_vec, y_vec);

set(gca,'XLim', [-10000 10000],'YLim',[-10000 10000]);

drawnow;

title('The Boids Are on The Run')
axis('square') %make sure aspect ratio is equal
end



%%%%% HELPER FUNCTION %%%%%%%%
function yval = getTheta(grid_size, theta)
yval = tan(theta) *grid_size; 
end 

