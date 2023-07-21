function actions_matrix = actions_with_walls(Maze,actions_matrix,n,wall)
% For each allowed actions that was identified in actions_matrix
% Cross check and update the actions will wall.
% update actions to zero if I have a wall as my destination cell
% update actions to zero if i have to pass through a wall 
% Self actions are updated too

k = 1;
for i = 1: n*n
    x = actions_matrix(k,1);
    y = actions_matrix(k,2);

    % North function
    if actions_matrix(k,3) == 1 
        if Maze(x-1,y) == wall
            actions_matrix(k,3) = 0 ;
        end
    end

    % South function
    if actions_matrix(k,4) == 1 
        if Maze(x+1,y) == wall
            actions_matrix(k,4) = 0 ;
        end
    end

    % East function
    if actions_matrix(k,5) == 1 
        if Maze(x,y+1) == wall
            actions_matrix(k,5) = 0 ;
        end
    end

    % West function
    if actions_matrix(k,6) == 1 
        if Maze(x,y-1) == wall
            actions_matrix(k,6) = 0 ;
        end
    end

    % North East function
    if actions_matrix(k,7) == 1 
        if Maze(x-1,y+1) == wall
            actions_matrix(k,7) = 0 ;
        end
    end

    % North West function
    if actions_matrix(k,8) == 1 
        if Maze(x-1,y-1) == wall
            actions_matrix(k,8) = 0 ;
        end
    end

    % South East function
    if actions_matrix(k,9) == 1 
        if Maze(x+1,y+1) == wall
            actions_matrix(k,9) = 0 ;
        end
    end

    % South West function
    if actions_matrix(k,10) == 1 
        if Maze(x+1,y-1) == wall
            actions_matrix(k,10) = 0 ;
        end
    end

    % Distance = 2
    % North function
    if actions_matrix(k,11) == 1 
        if Maze(x-2,y) == wall || Maze(x-1,y) == wall
            actions_matrix(k,11) = 0 ;
        end
    end

    % South function
    if actions_matrix(k,12) == 1 
        if Maze(x+2,y) == wall || Maze(x+1,y) == wall
            actions_matrix(k,12) = 0 ;
        end
    end

    % East function
    if actions_matrix(k,13) == 1 
        if Maze(x,y+2) == wall || Maze(x,y+1) == wall
            actions_matrix(k,13) = 0 ;
        end
    end

    % West function
    if actions_matrix(k,14) == 1 
        if Maze(x,y-2) == wall || Maze(x,y-1) == wall
            actions_matrix(k,14) = 0 ;
        end
    end

    % North East function
    if actions_matrix(k,15) == 1 
        if Maze(x-2,y) == wall || Maze(x-1,y) == wall || Maze(x-2,y+1) == wall
            actions_matrix(k,15) = 0 ;
        end
    end

    % North West function
    if actions_matrix(k,16) == 1 
        if Maze(x-2,y) == wall || Maze(x-1,y) == wall || Maze(x-2,y-1) == wall
            actions_matrix(k,16) = 0 ;
        end
    end

    % South East function
    if actions_matrix(k,17) == 1 
        if Maze(x+2,y) == wall || Maze(x+1,y) == wall || Maze(x+2,y+1) == wall
            actions_matrix(k,17) = 0 ;
        end
    end

    % South West function
    if actions_matrix(k,18) == 1 
        if Maze(x+2,y) == wall || Maze(x+1,y) == wall || Maze(x+2,y-1) == wall
            actions_matrix(k,18) = 0 ;
        end
    end

    % East East North function
    if actions_matrix(k,19) == 1 
        if Maze(x,y+2) == wall || Maze(x,y+1) == wall || Maze(x-1,y+2) == wall
            actions_matrix(k,19) = 0 ;
        end
    end

    % East East South function
    if actions_matrix(k,20) == 1 
        if Maze(x,y+2) == wall || Maze(x,y+1) == wall || Maze(x+1,y+2) == wall
            actions_matrix(k,20) = 0 ;
        end
    end

    % West West North function
    if actions_matrix(k,21) == 1 
        if Maze(x,y-2) == wall || Maze(x,y-1) == wall || Maze(x-1,y-2) == wall
            actions_matrix(k,21) = 0 ;
        end
    end

    % West West South function
    if actions_matrix(k,22) == 1 
        if Maze(x,y-2) == wall || Maze(x,y-1) == wall || Maze(x+1,y-2) == wall
            actions_matrix(k,22) = 0 ;
        end
    end


    % Self state action
    if Maze(x,y) == wall
        actions_matrix(k,23) = 0;
    end

    k=k+1;
end
end