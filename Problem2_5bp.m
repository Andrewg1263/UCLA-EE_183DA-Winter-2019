function [Values] = Problem2_5bp(Pi,Lambda,pe)

Values=zeros(6,6,12);
Vupdate=Values+1;

while sum(sum(sum(abs((Vupdate-Values))<.001)))>1 %
    Vupdate=Values;
    Values=zeros(6,6,12);
    for i=0:5 %X
        for j=0:5 %Y
            for k=0:11 %H
                for l=0:5 %X'
                    for m=0:5 %Y'
                        for n=0:11 %H'
                            Values(i+1,j+1,k+1)=Values(i+1,j+1,k+1)+Problem2_1c(pe,[i,j,k],Pi(i+1,j+1,k+1),[l,m,n])*(Problem2_5br([i,j,k])+Lambda*Vupdate(l+1,m+1,n+1));
                        end
                    end
                end
            end
        end
    end

end

end

