function [PiOptimal] = Problem2_3g(PiNot,Lambda,Pe)
Pi=PiNot;
Loop=true;
while Loop==true
    Curr=Problem2_3d(Pi,Lambda,Pe);
    Piupdate=Problem2_3f(Curr,Pe);
    if sum(sum(sum(Piupdate==Pi)))==432
        Loop=false;
    end
    Pi=Piupdate;
end
PiOptimal=Pi;
end