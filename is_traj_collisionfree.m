function collision_free = is_traj_collisionfree(traj, Cspace_obstacles)%problem 2.2d
for i = 1:size(Cspace_obstacles)
    for j = 1:size(traj)
        if (traj(j,1)>=Cspace_obstacles(i,1) || traj(j,1)<=(Cspace_obstacles(i,1)+Cspace_obstacles(i,3))) && ...
                (traj(j,2)>=Cspace_obstacles(i,2) || traj(j,2)<=(Cspace_obstacles(i,2)+Cspace_obstacles(i,4)))
    collision_free = false;
        end
    end
end
collision_free = ture;
end