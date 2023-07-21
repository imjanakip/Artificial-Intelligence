function east = move_east(actions_matrix,row,i,j,value_matrix_i,prob_d1,prob_d2,d,reward,discount_rate)
if d == 1
    columns1 = [5,7,9];
    columns2 = [];
else
    columns2 = [13,19,20,5];
    columns1 = [];
end
action_value = [];
value_temp_matrix = [];

for k = 1:length(columns1)
    action_value = [action_value,actions_matrix(row,columns1(k))];
    if actions_matrix(row,columns1(k)) == 0
        value_temp_matrix = [value_temp_matrix,value_matrix_i(i,j)];
    else
        if k == 1
            value_temp_matrix = [value_temp_matrix,value_matrix_i(i,j+d)];
        elseif k ==2
            value_temp_matrix = [value_temp_matrix,value_matrix_i(i-d,j+d)];
        elseif k ==3
            value_temp_matrix = [value_temp_matrix,value_matrix_i(i+d,j+d)];
        end
    end
end

for k = 1:length(columns2)
    action_value = [action_value,actions_matrix(row,columns2(k))];
    if actions_matrix(row,columns2(k)) == 0
        value_temp_matrix = [value_temp_matrix,value_matrix_i(i,j)];
    else
        if k == 1
            value_temp_matrix = [value_temp_matrix,value_matrix_i(i,j+d)];
        elseif k == 2
            value_temp_matrix = [value_temp_matrix,value_matrix_i(i-1,j+d)];
        elseif k == 3
            value_temp_matrix = [value_temp_matrix,value_matrix_i(i+1,j+d)];
        elseif k == 4
            value_temp_matrix = [value_temp_matrix,value_matrix_i(i,j+1)];
        end
    end
end

if d == 1
east = reward + discount_rate * (prob_d1(2) * value_temp_matrix(1) + prob_d1(1) * value_temp_matrix(2) + prob_d1(3) * value_temp_matrix(3));
else
east = reward + discount_rate * (prob_d2(1) * value_temp_matrix(2) + prob_d2(2) * value_temp_matrix(1) + prob_d2(3) * value_temp_matrix(3) + prob_d2(4) * value_temp_matrix(4));
end
end