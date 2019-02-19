function [Sprime] = Problem2_1d(pe,s,a)
temp=rand(); 
for x=0:5 %x'
    for y=0:5 %y'
        for h=0:11 %h'
            temp=temp-Problem2_1c(pe,s,a,[x,y,h]);
            if temp<=0
                Sprime=[x,y,h]; 
                temp=temp+100; 
            end
        end
    end
end


end