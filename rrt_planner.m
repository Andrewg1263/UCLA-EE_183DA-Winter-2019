function [traj, path] = rrt_planner(initial_state, goal_state, sample_boundary, max_step)
%problem 2.2e
    node = [initial_state;goal_state];
    
    step = 0;
    reach_goal = false;
    
    while step <= max_step
%         # Whether can reach the goal
        close_to_goal = norm(goal_state - node(end));
        if close_to_goal < 100
            reach_goal = true;
            break
        end
%random point
        pnt_random = [0 0 0];
        
        for i = 1:3
            pnt_random(i) = rand(sample_boundary(i,1), sample_boundary(i,2));
        end
        step = step +1;
    end
        
%Find nearest node
        [nearestNode, min_index] = find_closestnode(nodelist, pnt_random);
        [traj_temp, useless] = trajectory_generation(nearestNode, pnt_random, 0);
        if is_traj_collisionfree(traj_temp, Cspace_ob) == ture
            newNode = traj_temp(end,:);
            newNode(1,3) = min_index;
            nodelist = [nodelist;newNode];
        end
        print("Number of run:", lenth(nodelist));
    
%Find the path with all via points
    path = goal_state; %debug begin
    lastIndex = length(nodelist);
    while  isempty(nodelist(lastIndex)) ~= 0
        node = nodelist(lastIndex);
        path = [path;node];
        lastIndex = node;
    end
    path = [path;initial_state];%debug end
    
    traj = [];
    i = length(path);
    while i >= 1
        [traj_temp, useless] = trajectory_generation(path(i,:), path(i-1,:), 1);
        traj = traj + traj_temp;
        i = i - 1;
    end
end