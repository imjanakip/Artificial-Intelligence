function display_maze(maze,final_path_2)

% Replace values with color indices
maze(maze == 0) = 4; % Empty space (0): White
maze(maze == -999) = 3; % Wall (-999): Black
maze(maze == 100) = 2; % End (100): Yellow
maze(1, 1) = 1; % Start (1, 1): Cyan
maze(maze == -50) = 5; % Wall (-999): Black

% Define the colormap for the color indices
my_colormap = [0, 1, 1; % Cyan (Start)
               1, 1, 0; % Yellow (End)
               0, 0, 0; % Black (Wall)
               1, 1, 1; % White (Empty space)
               ]; 

% Display the matrix as an image using imagesc
figure;
imagesc(maze);
colormap(my_colormap);

% Set the YDir property to 'normal' and then to 'reverse'
set(gca, 'YDir', 'normal');
set(gca, 'YDir', 'reverse');

% Adjust axis limits to fit the size of the maze
axis equal;
axis([0.5, size(maze, 2)+0.5, 0.5, size(maze, 1)+0.5]); % Set X and Y axis limits

% Turn on grid lines
grid on;

% Set grid properties (optional)
set(gca, 'GridLineStyle', '-');
set(gca, 'GridColor', 'k');
set(gca, 'GridAlpha', 0.5);

% Set X and Y tick marks at integer intervals
xticks(1.5:size(maze, 2)+0.5);
yticks(1.5:size(maze, 1)+0.5);


% Add the title to the plot
title('Markov Decision Process');


% Hold the current plot to add the diamond shapes
hold on;

% Loop through the final_path_2 matrix and place a diamond shape at each position
for i = 1:size(final_path_2, 1)
    diamond_position = final_path_2(i, :); % Row i, all columns
    scatter(diamond_position(2), diamond_position(1), 200, 'r', 'd', 'filled', 'MarkerEdgeColor', 'k');
    pause(0.5); % Optional: pause between each diamond for better visualization
end

% Release the hold on the plot
hold off;
end