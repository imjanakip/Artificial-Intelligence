function allowed_actions = allowed_state_actions(Maze,n)

% action matrix is created for each cells in the maze
% D = 1
% Column 3 4 5 6 North(N) South(S) East(E) West(W)
% Column 7 8 9 10 NE NW SE SW
% Column 11 12 13 14 NN SS EE WW
% D = 2
% Column 15 16 17 18 NNE NNW SSE SSW
% Column 19 20 21 22 EEN EES WWN WWS
% Column 23 Self State
% Column 24 Value of the Cell in Maze
allowed_actions = zeros(n*n,24);

k = 1;
for i = 1: n
    for j = 1: n

    allowed_actions(k,1) = i;
    allowed_actions(k,2 )= j;

    % NORTH D = 1
    if i > 1 
        allowed_actions(k,3) = 1;
    end
    
    % SOUTH D = 1
    if i ~= n 
         allowed_actions(k,4) = 1;
    end
    
    % EAST D = 1
    if j ~= n 
        allowed_actions(k,5) = 1;
    end
    
    % WEST D = 1
    if j > 1
        allowed_actions(k,6) = 1;
    end
    
    % slipping to sides with D = 1
    allowed_actions(k,7) = allowed_actions(k,3) && allowed_actions(k,5);
    allowed_actions(k,8) = allowed_actions(k,3) && allowed_actions(k,6);
    allowed_actions(k,9) = allowed_actions(k,4) && allowed_actions(k,5);
    allowed_actions(k,10) = allowed_actions(k,4) && allowed_actions(k,6);


    % NORTH D = 2
    if i > 2 
        allowed_actions(k,11) = 1;
    end
    
    % SOUTH D = 2
    if i <= n-2 
         allowed_actions(k,12) = 1;
    end
    
    % EAST D = 2
    if j <= n-2
        allowed_actions(k,13) = 1;
    end
    
    % WEST D = 2
    if j > 2 
        allowed_actions(k,14) = 1;
    end

   
    % slipping to sides with D = 2 & NORTH
    allowed_actions(k,15) = allowed_actions(k,11) && allowed_actions(k,5);
    allowed_actions(k,16) = allowed_actions(k,11) && allowed_actions(k,6);

    % slipping to sides with D = 2 & SOUTH
    allowed_actions(k,17) = allowed_actions(k,12) && allowed_actions(k,5);
    allowed_actions(k,18) = allowed_actions(k,12) && allowed_actions(k,6);

    % slipping to sides with D = 2 & EAST
    allowed_actions(k,19) = allowed_actions(k,3) && allowed_actions(k,13);
    allowed_actions(k,20) = allowed_actions(k,4) && allowed_actions(k,13);

    % slipping to sides with D = 2 & WEST
    allowed_actions(k,21) = allowed_actions(k,3) && allowed_actions(k,14);
    allowed_actions(k,22) = allowed_actions(k,4) && allowed_actions(k,14);

    % Self state action
    allowed_actions(k,23) = 1;
    
    % Storing maze value to differentiate between walls and empty space.
    allowed_actions(k,24) = Maze(i,j);
    k = k + 1;
    end
end

end