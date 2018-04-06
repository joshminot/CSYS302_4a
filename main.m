function main(options)
%
%
% initialize positions randomly

all_boids = initialize_positions(options.grid_size, options.num_boids);

% loop to draw boids and move boids to new positions
num_boids = options.num_boids;

% x_vec = zeros(num_boids, 1);
% 
% y_vec = zeros(num_boids, 1);
% 
% u_vec = zeros(num_boids, 1);
% 
% v_vec = zeros(num_boids, 1); 

velocity = [all_boids(:).vel];

u_vec = velocity(1:2:length(velocity)-1);
v_vec = velocity(2:2:length(velocity));

position = [all_boids(:).pos];

x_vec = position(1:2:length(position)-1);
y_vec = position(2:2:length(position));


[fighandle, plothandle] = plotMapInNewFigure(x_vec, y_vec); % PLOT INITIAL MAP (see function below)



for rep=1:options.num_its
%     draw_boids(x_vec, y_vec, u_vec, v_vec, @plotMapInNewFigure);
    set(plothandle, 'XData', x_vec, 'YData', y_vec);
    drawnow;
    [x_vec, y_vec, u_vec, v_vec] = move_all_boids_to_new_positions(x_vec, y_vec, u_vec, v_vec, num_boids); 
    
end

end 


%%% HELPER FUNCTION TO PLOT MAP USING IMAGESC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[fighandle, plothandle] =  plotMapInNewFigure(x_vec, y_vec)

fighandle=figure;
% set(fighandle,'position',[42   256   560   420]); % specify location of figure
% set(gca,'XLim', [-4000 4000],'YLim',[-4000 4000]);
% xlim([-10000 10000]);
% ylim([-10000 10000]);
 % doesn't truncate a row and col like pcolor does
plothandle = scatter(x_vec, y_vec);
set(gca,'XLim', [-10000 10000],'YLim',[-10000 10000]);

drawnow;

title('The Boids Are on The Run')
axis('square') %make sure aspect ratio is equal
end