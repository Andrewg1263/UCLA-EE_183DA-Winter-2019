function [x,y,theta] = kalman(x0,y0,theta0,t,vld,vrd,x1,y1,theta1)
initial = [x0;y0;theta0];
% V = [vld*pi/180*20;vrd*pi/180*20;];
update = [x1;y1;theta1];
A = eye(3); %define the state matrix
C = eye(3); %define the output matrix
B = t*[1/2*cos([0,0,1]*initial/180*pi),1/2*cos([0,0,1]*initial/180*pi);1/2*sin([0,0,1]*initial/180*pi),1/2*sin([0,0,1]*initial/180*pi);-1/70,1/70]; 

    varleft = 0.2981297941; %standard deviation ax
    varright = 0.2590436048; %standard deviation ay
    senseor = [3.296703297, 0, 0;
                    0, 1.148351648, 0;
                    0, 0, 0.0001664735606];
    R = senseor*C*C';
    Q = [varleft,0; 0,varright];
    P=B*Q*B';
    testpath(:,1) = initial;
    for i=2:1:length(x1-1)
        [tempx,tempy,tempt] = state(testpath(1,i-1),testpath(2,i-1),testpath(3,i-1),0.1,vld,vrd);
        testpath(1,i) = tempx(1,2);
        testpath(2,i) = tempy(1,2);
        testpath(3,i) = tempt(1,2);
        P=A*P*A'+B*Q*B'; %predicting P
        Kalman = P*C'/(C*P*C'+R); %calculating the Kalman gains
        testpath(:,i) = testpath(:,i)+Kalman*(update(:,i)-C*testpath(:,i)); %Correcting: estimating the state
        P = (eye(3)-Kalman*C)*P; %Correcting: estimating P
    end

x = testpath(1,:);
y = testpath(2,:);
theta = testpath(3,:);

plot(x,y);
title('Position of Car With Kalman Filter');
xlabel('X position(mm)');
ylabel('Y position(mm)');

end 