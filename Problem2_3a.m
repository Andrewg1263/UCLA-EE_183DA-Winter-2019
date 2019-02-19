function [a] = Problem2_3a(s)
target = [4,4,0];
xerr = target(1)-s(1);
yerr = target(2)-s(2);
angle = atan2d(yerr,xerr); 
high = 90-s(3)*30; 
herr = mod(angle-high,360); 

if (abs(xerr)+abs(yerr)==0)
    a = "n"; 
elseif (herr<=90 || herr>=270) 
    s = Problem2_1d(0,s,"f");
    xerr=target(1)-s(1);
    yerr=target(2)-s(2);
    angle=atan2d(yerr,xerr); 
    high=90-s(3)*30; 
    herr=mod(angle-high,360); 
    if (((herr<=15) || (herr>=345))||((herr>=165)&&(herr<=195)))
        a="f"; 
    elseif (((herr>15) && (herr<=90))||((herr>195)&&(herr<270)))
        a="fl"; 
    elseif (((herr>=270) && (herr<345))||((herr>90)&&(herr<165)))
        a="fr"; 
    end
    
else 
    s=Problem2_1d(0,s,"b");
    xerr=target(1)-s(1);
    yerr=target(2)-s(2);
    angle=atan2d(yerr,xerr);
    high=90-s(3)*30;
    herr=mod(angle-high,360); 
    if (((herr<=15) || (herr>=345))||((herr>=165)&&(herr<=195)))
        a="b"; 
    elseif (((herr>15) && (herr<=90))||((herr>195)&&(herr<270)))
        a="bl"; 
    elseif (((herr>=270) && (herr<345))||((herr>90)&&(herr<165)))
        a="br"; 
    end
end

end