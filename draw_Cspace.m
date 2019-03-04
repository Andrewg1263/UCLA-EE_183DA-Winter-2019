%problem 2.2a
function ax = draw_Cspace(initial_state, goal_state, obstaclelist)
figure;
hold on;
axis([0 1800 0 1200]);
for i=1:size(obstaclelist)
    ob = obstaclelist(i,:);
    rectangle('Position',[ob(1) ob(2) ob(3) ob(4)],'FaceColor','k','EdgeColor','y');
end
plot(initial_state(1), initial_state(2),'^r','linewidth',18);
plot(goal_state(1), goal_state(2),'^g', 'linewidth',18);

end