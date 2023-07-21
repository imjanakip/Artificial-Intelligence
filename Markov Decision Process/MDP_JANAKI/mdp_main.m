clear
clc

% Loop through files from maze1_mpd.csv to maze6_mdp.csv
for file_number = 1:6
    
    % Create the filename using sprintf
    filename = sprintf('maze%d_mdp.csv', file_number);  
    maze = readmatrix(filename);

    % Setting value for reward wall and target
    reward = -0.03;
    wall = -999;
    target = 100;
    
    [n,m] = size(maze);

    % creating a matrix for holding numbers during value iteration process
    % for d = 1
    value_matrix_i = maze;
    value_matrix_i1 = value_matrix_i;
    
    % creating a matrix for holding numbers during value iteration process
    % for d = 2
    value_matrix_id2 = maze;
    value_matrix_i1d2 = value_matrix_id2;
    
    % Probability for d = 1
    % Direct 0.7 
    % Side Left 0.1 
    % Side Right 0.1 
    % Same 0.1
    prob_d1 = [0.1,0.7,0.1,0.1];
    
    discount_rate = rand;

    if file_number <= 3
        % Probability for d = 2 (Only for maze 1 through 3)
        % Direct 1 step 0.2 
        % Direct two step 0.5 
        % Side Left 0.1 
        % Side Right 0.1 
        % Same 0.1
        prob_d2 = [0.1,0.5,0.1,0.1,0.2];
    else
        % Probability for d = 2 (Only for maze 4 through 6)
        % Direct 1 step 0.05
        % Direct two step 0.1
        % Side Left 0.1 
        % Side Right 0.7 
        % Same 0.05
        prob_d2 = [0.1,0.1,0.7,0.05,0.05];
    end

    % all permitted actions of the states(each cell) are identified
    actions_matrix = allowed_state_actions(maze,n);
    
    % all permitted actions of the states are identified along with walls 
    actions_matrix = actions_with_walls(maze,actions_matrix,n,wall);
    
    
    % Calculate Value Iteration
    
    while true
        qij = [];
        qij2 = [];
        for i = 1:n
            for j = 1:m
                if maze(i,j) ~= wall && maze(i,j) ~= target
                   row = find(actions_matrix(:,1)==i & actions_matrix(:,2)==j);

                   qij = zeros(1,4);
                   qij(1) = move_north(actions_matrix,row,i,j,value_matrix_i,prob_d1,prob_d2,1,reward,discount_rate);
                   qij(2) = move_south(actions_matrix,row,i,j,value_matrix_i,prob_d1,prob_d2,1,reward,discount_rate);
                   qij(3) = move_east(actions_matrix,row,i,j,value_matrix_i,prob_d1,prob_d2,1,reward,discount_rate);
                   qij(4) = move_west(actions_matrix,row,i,j,value_matrix_i,prob_d1,prob_d2,1,reward,discount_rate); 
                   value_matrix_i1(i,j) = max(qij);

                   qij2 = zeros(1,4);
                   qij2(1) = move_north(actions_matrix,row,i,j,value_matrix_id2,prob_d1,prob_d2,2,reward,discount_rate);
                   qij2(2) = move_south(actions_matrix,row,i,j,value_matrix_id2,prob_d1,prob_d2,2,reward,discount_rate);
                   qij2(3) = move_east(actions_matrix,row,i,j,value_matrix_id2,prob_d1,prob_d2,2,reward,discount_rate);
                   qij2(4) = move_west(actions_matrix,row,i,j,value_matrix_id2,prob_d1,prob_d2,2,reward,discount_rate);
                   value_matrix_i1d2(i,j) = max(qij2);                 
                   
                   qij = [];
                   qij2=[];
                else
                    value_matrix_i1(i,j) = value_matrix_i(i,j);
                    value_matrix_i1d2(i,j) = value_matrix_id2(i,j);
                end
            end
        end
             
        diff1 = abs(value_matrix_i - value_matrix_i1);
        diff2 = abs(value_matrix_id2 - value_matrix_i1d2);
    
        if all(diff1 < 1e-20) & all(diff2 < 1e-20)
            disp("Value Iteration Convereged");
            value_matrix_i = value_matrix_i1;
            value_matrix_id2 = value_matrix_i1d2;
            break;
        end
        
        % swapping value iteration matrix for next round
        value_matrix_i = value_matrix_i1;
        value_matrix_i1 = maze;

        % swapping value iteration matrix for next round
        value_matrix_id2 = value_matrix_i1d2;
        value_matrix_i1d2 = maze;
    
    end

    % Identifying Optimal policy
    final_path_2 = calculate_optimal_policy(value_matrix_i,value_matrix_i1d2,actions_matrix);
    
    % Displaying optimal policy
    display_maze(maze,final_path_2);
    clear;

end