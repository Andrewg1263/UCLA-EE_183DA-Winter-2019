function ax =  draw_robot(traj)
    start = traj(1,:)
    endt = traj(end,:)
    ax = draw_Cspace(start, endt, obstaclelist)

    for i = 1:size(traj)
        pnt = traj(i,:)
        theta = pnt(3);
        rec_corner = [pnt(1)+70*cos(theta+np.pi)+42.5*cos(theta-np.pi/2),pnt(2)+70*sin(theta+np.pi)+42.5*sin(theta-np.pi/2)]
        plot(rec_corner,'*r');
        hold on
    end
end