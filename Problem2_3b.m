function [Trajectory] = Problem2_3b(Pi,s0,pe)
Trajectory=s0;
s=s0;
while (abs(s(1)-4)+abs(s(2)-4))~=0
    x=s(1); y=s(2); h=s(3);
    move=Pi(x+1,y+1,h+1);
    s=Problem2_1d(pe,s,move);
    Trajectory=cat(1,Trajectory,s);
end
Length=size(Trajectory,1);
figure;
plot3(Trajectory(:,1),Trajectory(:,2),Trajectory(:,3))
xlabel('X');ylabel('Y');zlabel('H');
axis([0,5,0,5,0,11]);
% xticks([0:5]);
% yticks([0:5]);
% zticks([0:11]);
grid on;
hold on;
scatter3(Trajectory(1,1),Trajectory(1,2),Trajectory(1,3),'k')
% text(Trajectory(1,1),Trajectory(1,2),Trajectory(1,3),'Initial')
scatter3(Trajectory(Length,1),Trajectory(Length,2),Trajectory(Length,3),'k','filled')
% text(Trajectory(Length,1),Trajectory(Length,2),Trajectory(Length,3),'Target')
% legend('Path','Input','Target');
hold off



end