function [v] = Problem2_3d(Pi,Lambda,pe)
v=zeros(6,6,12);

v1=v+1;

while sum(sum(sum(abs((v1-v))<0.0001)))~=432 %run until none of the values change by more than 0.0001
    v1=v;
    v=zeros(6,6,12);
    for x=0:5 %X
        for y=0:5 %Y
            for h=0:11 %H
                for x1=0:5 %X'
                    for y1=0:5 %Y'
                        for h1=0:11 %H'
                            v(x+1,y+1,h+1)=v(x+1,y+1,h+1)+TransProb2(pe,[x,y,h],Pi(x+1,y+1,h+1),[x1,y1,h1])*(Problem2_2a([x,y,h])+Lambda*v1(x1+1,y1+1,h1+1));
                        end
                    end
                end
            end
        end
    end
end
end