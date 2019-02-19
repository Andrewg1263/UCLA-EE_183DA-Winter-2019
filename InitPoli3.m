function [a] = InitPoli3(s)

goal=[4,4,0];
xerror=goal(1)-s(1);
yerror=goal(2)-s(2);
angled=atan2d(yerror,xerror); %desired heading in degrees
hangle=90-s(3)*30; %convert current heading into angle in degrees
herror=mod(angled-hangle,360); %find error between current heading and desired heading and make between 0 and 360 degrees

%Take the appropriate action for the given policy based on the heading error
%If the heading error is 15 degrees from heading 0 or 6, don't change
%heading (chosen arbitrarily to reduce turning)
if (abs(xerror)+abs(yerror))==0
    a="N"; 
elseif herror<=90 || herror>=270 %Move forward
    s=NextS(0,s,"F");
    xerror=goal(1)-s(1);
    yerror=goal(2)-s(2);
    angled=atan2d(yerror,xerror); %desired heading in degrees
    hangle=90-s(3)*30; %convert current heading into angle in degrees
    herror=mod(angled-hangle,360); %find error between current heading and desired heading
    if (((herror<=15) || (herror>=345))||((herror>=165)&&(herror<=195)))
        a="F"; %Output next action should be to move forward
    elseif (((herror>15) && (herror<=90))||((herror>195)&&(herror<270)))
        a="FL"; %Output next action should be to move forward left
    elseif (((herror>=270) && (herror<345))||((herror>90)&&(herror<165)))
        a="FR"; %Output next action should be to move forward right
    end
else %Move Backward
    s=NextS(0,s,"B");
    xerror=goal(1)-s(1);
    yerror=goal(2)-s(2);
    angled=atan2d(yerror,xerror); %desired heading in degrees
    hangle=90-s(3)*30; %convert current heading into angle in degrees
    herror=mod(angled-hangle,360); %find error between current heading and desired heading
    if (((herror<=15) || (herror>=345))||((herror>=165)&&(herror<=195)))
        a="B"; %Output next action should be to move backward
    elseif (((herror>15) && (herror<=90))||((herror>195)&&(herror<270)))
        a="BL"; %Output next action should be to move backward left
    elseif (((herror>=270) && (herror<345))||((herror>90)&&(herror<165)))
        a="BR"; %Output next action should be to move backward right
    end
end

end

