function [Path] = Problem2_3b(Pi,s0,pe)
Path=s0;
s=s0;
while (abs(s(1)-4)+abs(s(2)-4))~=0
    x=s(1); y=s(2); h=s(3);
    move=Pi(x+1,y+1,h+1);
    s=NextS(pe,s,move);
    Path=cat(1,Path,s);
end
Length=size(Path,1);
figure;

plot(Path(:,1),Path(:,2));
xlabel('X')
ylabel('Y')


axis([0,5,0,5])
xticks([0:5])
yticks([0:5])

grid on
hold on

scatter(Path(1,1),Path(1,2),Path(1,3),'k')
scatter(Path(Length,1),Path(Length,2),'k','filled')
legend('Path','Input','Target');
hold off



end