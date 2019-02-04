function [x,y,theta] = state(x0,y0,theta0,t,vld,vrd)
temp = 0:0.1:t;
    for i = 1:length(temp)
        vl = vld*pi/180*20; %mm/s
        vr = vrd*pi/180*20;
        x(i) = x0; 
        y(i) = y0; 
        theta(i) = theta0;
        x0 = x0+(1/2*vl*0.1*cos(theta0*pi/180) + 1/2*vr*0.1*cos(theta0*pi/180));
        y0 = y0+(1/2*vl*0.1*sin(theta0*pi/180) + 1/2*vr*0.1*sin(theta0*pi/180));
        theta0 = theta0+0.1*(-1/70*vl + 1/70*vr);
    end
%     plot(x,y,'-o');
%     title('Position of Car Without Kalman Filter');
%     xlabel('X position(mm)');
%     ylabel('Y position(mm)');
end
