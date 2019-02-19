function [PiOptimal] = Problem2_5b(PiNot,Lambda,Pe)

Pi=PiNot;
Loop=true;
while Loop==true;
    Curr=Problem2_5bp(Pi,Lambda,Pe);
    PiNew=NextPi3(Curr,Pe);
    if sum(sum(sum(PiNew==Pi)))==432
        Loop=false;
    end
    Pi=PiNew;
end
PiOptimal=Pi;
end

