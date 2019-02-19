function [Target] = PiNot()
for x=0:5; %x
    for y=0:5; %y
        for h=0:11; %h
            Target(x+1,y+1,h+1)=InitPoli3([x,y,h]); 
        end
    end
end
end

