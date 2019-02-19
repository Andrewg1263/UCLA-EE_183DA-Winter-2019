function [Pi] = Problem2_3f(current,pe)
PiV=zeros(6,6,12);
PiV=PiV-10^100; 
for x=0:5 %X
    for y=0:5 %Y
        for h=0:11 %H
            for a=["leftforward","forward","rightforward","leftbackward","backward","righbackward"]
                temp=0;
                for x1=0:5 %X'
                    for y1=0:5 %Y'
                        for h=0:11 %H'
                                temp=temp+Problem2_1c(pe,[x,y,h],a,[x1,y1,h])*current(x1+1,y1+1,h+1); 
                        end
                    end
                end
                if PiV(x+1,y+1,h+1)<temp
                    PiV(x+1,y+1,h+1)=temp;
                    Pi(x+1,y+1,h+1)=a;
                end
            end
        end
    end
end
Pi(4,5,:)="standby";
end