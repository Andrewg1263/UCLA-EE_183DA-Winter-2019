clc;clear all; close all;
%2.1(a)
disp('2.1(a): Size of state space, Ns=6*6*12=432');

%2.1(b)
disp('2.1(b): The robot can "go forward","left forward","right forward","backward","left backward","right backward","stand by",N_A=7 ');

%2.1(c)
disp('2.1(c): Matlab code: Problem2_1c.m');

%2.1(d)
disp('2.1(d): Matlab code: Problem2_1d.m');

%2.2(a)
disp('2.2(a): Matlab code: Problem2_2a.m');

%2.3(a)
disp('2.3(a): Matlab code: Problem2_3a.m');

%2.3(b)
disp('2.3(b): Matlab code: Problem2_3b.m');

%2.3(c)
disp('Trajectory:');
disp(Problem2_3b(PiNot,[1,4,6],0));
title('Problem2.3(c)');
legend('Path','Input','Target');


%2.3(d)
disp('2.3(d): Matlab code: Problem2_3d.m');

%2.3(e)
value3e=Problem2_3d(PiNot(),0.9,0);
disp(['the probability distribution specified by psa:',num2str(value3e(2,5,7)),'.']) 

%2.3(f)
disp('2.3(f):Matlab code: Problem2_3f.m');

%2.3(g)
disp('2.3(g):Matlab code: Problem2_3g.m');

%2.3(h)
disp('2.3(h)')
tic
value3h=Problem2_3g(PiNot(),0.9,0);
path3h=Problem2_3b(value3h,[1,4,6],0);%plot graph
disp('Trajectory:');
disp(path3h)
title('Problem2.3(h)');
Values3h=Problem2_3d(value3h,0.9,0);
disp(['the robot described in 2.3(c): ',num2str(Values3h(2,5,7)),'.'])

%2.3(i)
disp('2.3(i)')
toc


%2.4(a)
disp('2.4(a): Matlab code: Problem2_4a.m');

%2.4(b)
disp('4(b)')
tic
[value4b1,value4b2]=Problem2_4a(0.9,0);
path4b=Problem2_3b(value4b1,[1,4,6],0);%plot
disp('Trajectory:');
disp(path4b)
title('Problem2.4(b)');
disp('differnt in same policy:')
diffP=432-sum(sum(sum(value3h==value4b1)))
disp('differnt in same Values:')
diffV=sum(sum(sum(Values3h-value4b2)))

%2.4(c)
disp('4(c)')
toc


%2.5(a)
disp('2.5(a):')
% tic
value5a=Problem2_3g(PiNot(),0.9,0.1);
path5a=GenTraj(value5a,[1,4,6],0.1);
disp('Trajectory:')
disp(path5a)
title('Problem2.5(a)');
Values5a=Problem2_3d(value5a,0.9,0.1);
% toc

%2.5(b)
disp('2.5(b): ');

value5b=Problem2_5b(PiNot(),0.9,0.25);
path5b=Problem2_3b(value5b,[1,4,6],0.25);
disp('Trajectory:');
disp(path5b)
title('Problem2.5(b)');

%2.5(c)
disp('2.5(c): If we increase Pe error, the robot would be much likely have new path and longer.'); 
disp('Additional, if we try to make the robot facing down. The robot more likely have longer path, and some time will hit the wall');


