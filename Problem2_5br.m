function [value] = Problem2_5br(s)

if s(1)==0 || s(1)==5 || s(2)==0 || s(2)==5;
    value=-100;
elseif s(1)==1 || s(2)==1;
    value=0;
elseif s(1)==2 && (s(2)==3 || s(2)==4);
    value=-10;
elseif s(1)==4 && s(2)==4 && s(3)==6
        value=1;
else
    value=0;
end
end

