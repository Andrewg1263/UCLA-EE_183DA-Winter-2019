function [Reward] = Problem2_2a(s)
%red -100,yellow -10, green +1,
if (s(1)==0 || s(1)==5 || s(2)==0 || s(2)==5)%(0,0~5)(5,0~5)(0~5,0)(0~5,5)
    Reward=-100;
elseif (s(1)==3 && (s(2)==3 || s(2)==4))%(3,3)(3,4)
    Reward=-10;
elseif (s(1)==4 && s(2)==4)%(4,4)
    Reward=1;
elseif s(1)==1 || s(2)==1
    Reward=0;
else
    Reward=0;
end
end
