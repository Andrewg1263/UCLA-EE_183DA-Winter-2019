function [value1,value2] = Problem2_4a(Lambda,pe)

v1=zeros(6,6,12); %Initialize all values to 0
check=true; %loop until condition
Policy=strings(6,6,12);
while check
    Policy=strings(6,6,12);
    for i=0:5 %x
        for j=0:5 %y
            for k=0:11 %h
                c=-10^100; %dummy value of negative infinity to compare against
                for a=["FL","F","FR","BL","B","BR"] %consider all moves
                    b=0;
                    for l=0:5 %x'
                        for m=0:5 %y'
                            for n=0:11 %h'
                                b=b+Problem2_1c(pe,[i,j,k],a,[l,m,n])*(Problem2_2a([i,j,k])+Lambda*v1(l+1,m+1,n+1));
                            end
                        end
                    end
                    if b>c
                        c=b;
                        vupdate(i+1,j+1,k+1)=c;
                        Policy(i+1,j+1,k+1)=a;
                    end
                    if sum([i,j]==[4,4])==2 %Set the action for the goal to be no move, and update value
                        vupdate(i+1,j+1,k+1)=Problem2_1c(pe,[i,j,k],"N",[i,j,k])*(Problem2_2a([i,j,k])+Lambda*v1(i+1,j+1,k+1));
                        Policy(i+1,j+1,k+1)="N";
                    end
                end
            end
        end
    end
    if sum(sum(sum(abs(v1-vupdate)<0.0001)))<1 %if V has converged
        check=false; %stop looping
        value1=Policy;
        value2=vupdate;
    end
    
    v1=vupdate;
end

end

