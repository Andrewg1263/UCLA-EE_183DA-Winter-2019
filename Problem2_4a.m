function [PiStar,VStar] = Problem2_4a(Lambda,pe)
tempv=zeros(6,6,12); 
check=true; 
Policy=strings(6,6,12);
while check
    Policy=strings(6,6,12);
    for x=0:5 
        for y=0:5 %y
            for h=0:11 %h
                c=-10^100;
                for a=["leftforward","forward","rightforward","leftbackward","backward","righbackward"] 
                    b=0;
                    for x1=0:5 %x'
                        for y1=0:5 %y'
                            for h1=0:11 %h'
                                b=b+Problem2_1c(pe,[x,y,h],a,[x1,y1,h1])*(Problem2_2a([x,y,h])+Lambda*tempv(x1+1,y1+1,h1+1));
                            end
                        end
                    end
                    if b>c
                        c=b;
                        Vupdate(x+1,y+1,h+1)=c;
                        Policy(x+1,y+1,h+1)=a;
                    end
                    if sum([x,y]==[4,4])==2 
                        Vupdate(x+1,y+1,h+1)=Problem2_1c(pe,[x,y,h],"N",[x,y,h])*(Problem2_2a([x,y,h])+Lambda*tempv(x+1,y+1,h+1));
                        Policy(x+1,y+1,h+1)="N";
                    end
                end
            end
        end
    end
    if sum(sum(sum(abs(tempv-Vupdate)<0.0001)))==432 
        check=false; 
        PiStar=Policy;
        VStar=Vupdate;
    end
  
    tempv=Vupdate;
end

end
