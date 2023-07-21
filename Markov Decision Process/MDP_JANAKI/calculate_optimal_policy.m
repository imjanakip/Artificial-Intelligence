% Calculate Poilcy 
function final_path_2 = calculate_optimal_policy(value_matrix_i,value_matrix_i1d2,actions_matrix)
curr_x = 1;
curr_y = 1;
final_path_2 = [curr_x,curr_y];
while value_matrix_i(curr_x,curr_y) ~= 100
            row = find(actions_matrix(:,1)==curr_x & actions_matrix(:,2)==curr_y);
            % Identify the actions that can be taken for d = 1
            pi_actions = find(actions_matrix(row,3:10) ~=0) + 2;
            flag = false;
            % Identify the actions that can be taken for d = 2
            pi_actions_d2 = find(actions_matrix(row,3:6) ~=0) + 2;
            pi_actions_d2 = [pi_actions_d2,find(actions_matrix(row,11:22) ~=0) + 10];
            max_vi_value = 0;
            for i=1:length(pi_actions)
                flag = true;
                if pi_actions(i) == 3
                    new_x = curr_x-1;
                    new_y = curr_y;
                    if value_matrix_i(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions(i) == 4
                    new_x = curr_x+1;
                    new_y = curr_y;
                    if value_matrix_i(new_x,new_y) > max_vi_value
                        max_vi_value = value_matrix_i(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions(i) == 5
                    new_y = curr_y+1;
                    new_x = curr_x;
                    if value_matrix_i(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions(i) == 6
                    new_y = curr_y-1;
                    new_x = curr_x;
                    if value_matrix_i(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions(i) == 7
                    new_x = curr_x - 1;
                    new_y = curr_y + 1;
                    if value_matrix_i(new_x,new_y) > max_vi_value
                        max_vi_value = value_matrix_i(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end                
                elseif pi_actions(i) == 8
                    new_x = curr_x - 1;
                    new_y = curr_y - 1;
                    if value_matrix_i(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end  
                elseif pi_actions(i) == 9
                    new_x = curr_x + 1;
                    new_y = curr_y + 1;
                    if value_matrix_i(new_x,new_y) > max_vi_value
                        max_vi_value = value_matrix_i(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end  
                elseif pi_actions(i) == 10
                    new_x = curr_x + 1;
                    new_y = curr_y - 1;
                    if value_matrix_i(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end  
                end
            end
            
            for i = 1:length(pi_actions_d2)
            flag = true;
            if pi_actions_d2(i) == 3
                    new_x = curr_x-1;
                    new_y = curr_y;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions_d2(i) == 4
                    new_x = curr_x+1;
                    new_y = curr_y;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions_d2(i) == 5
                    new_y = curr_y+1;
                    new_x = curr_x;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions_d2(i) == 6
                    new_y = curr_y-1;
                    new_x = curr_x;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions_d2(i) == 11
                    new_y = curr_y;
                    new_x = curr_x-2;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions_d2(i) == 12
                    new_y = curr_y;
                    new_x = curr_x+2;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions_d2(i) == 13
                    new_y = curr_y+2;
                    new_x = curr_x;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions_d2(i) == 14
                    new_y = curr_y-2;
                    new_x = curr_x;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions_d2(i) == 15
                    new_x = curr_x-2;
                    new_y = curr_y+1;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions_d2(i) == 16
                    new_x = curr_x-2;
                    new_y = curr_y-1;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions_d2(i) == 17
                    new_x = curr_x+2;
                    new_y = curr_y+1;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions_d2(i) == 18
                    new_x = curr_x+2;
                    new_y = curr_y-1;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions_d2(i) == 19
                    new_x = curr_x-1;
                    new_y = curr_y+2;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions_d2(i) == 20
                    new_x = curr_x+1;
                    new_y = curr_y+2;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions_d2(i) == 21
                    new_x = curr_x-1;
                    new_y = curr_y-2;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                elseif pi_actions_d2(i) == 22
                    new_x = curr_x+1;
                    new_y = curr_y-2;
                    if value_matrix_i1d2(new_x,new_y) > max_vi_value 
                        max_vi_value = value_matrix_i1d2(new_x,new_y);
                        final_x = new_x;
                        final_y = new_y;
                    end
                end
            end
            if flag
            curr_x = final_x;
            curr_y = final_y;
            else
                final_x = curr_x;
                final_y = curr_y;
            end
            final_path_2 = [final_path_2;final_x,final_y];
end

end