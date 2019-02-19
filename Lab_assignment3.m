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
% p23e = (Problem2_3d(PiNot(),0.9,0));
disp('Value of the trajectory(λ = 0.9) = -0.65611');

%2.3(f)
disp('2.3(f):Matlab code: Problem2_3f.m');

%2.3(g)
disp('2.3(g):Matlab code: Problem2_3g.m');

%2.3(h)
figure;
pic2_3h = imread('2_3h2.jpg');
imshow(pic2_3h);
title('Problem2.3(h)');
pic2_3hTrajectory = [1,4,6;1,3,5;1,2,4;2,2,3;3,2,2;4,2,1;4,3,0;4,4,11];
disp('2.3(h): value of the robot described of input[1,4,6]: 2.5173');
disp('Trajectory:');
disp(pic2_3hTrajectory);


%2.3(i)
disp('2.3(i):1992.347975 second');

%2.4(a)
disp('2.4(a): Matlab code: Problem2_4a.m');

%2.4(b)
disp('2.4(b): different of Pi = 36; different of value = -3.7913e+03');

%2.4(c)
disp('2.4(c): Elapsed time = 667.956089');

%2.5(a)
disp('2.5(a): ');
clear all;
disp('Trajectory:');
disp(Problem2_3b(PiNot,[1,4,6],0.1));
legend('Path','Input','Target');
title('Problem2.5(a)');

%2.5(b)
disp('2.5(b): ');
clear all;
disp('Trajectory:');
disp(Problem2_3b(PiNot,[1,4,6],0.25));
legend('Path','Input','Target');
title('Problem2.5(b)');

%2.5(c)
disp('2.5(c): If we increase Pe error, the robot would be much likely have new path and longer.'); 
disp('Additional, if we try to make the robot facing down. The robot more likely have longer path.');


