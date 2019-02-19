function [P_saSPrime] = Problem2_1c(pe,s,a,sprime)

a=lower(a); 

x=s(1); y=s(2); h=s(3);
xupdate=[x,x,x]; yupdate=[y,y,y]; hupdate=[h,h,h]; p=[0,0,0]; 
P_saSPrime=0; 



if a=="n"
    hupdate=[mod(h,12),0,0]; p=[1,0,0]; 
end


if ((a=="fl") || (a=="bl")) 
    hupdate=[mod(h-1,12),mod(h,12),mod(h-2,12)]; 
    p=[1-2*pe,pe,pe]; 
elseif ((a=="f") || (a=="b")) %move but don't turn
    hupdate=[mod(h,12),mod(h+1,12),mod(h-1,12)]; 
    p=[1-2*pe,pe,pe]; 
elseif ((a=="fr")||(a=="br")) 
    hupdate=[mod(h+1,12),mod(h+2,12),mod(h,12)]; 
    p=[1-2*pe,pe,pe]; 
end


if ((a=="f")||(a=="fl")||(a=="fr")) %try to move forward;
    switch h
        case 0
            xupdate=[x,x,x];
            yupdate=[y+1,y+1,y+1];
        case 1
            xupdate=[x,x+1,x];
            yupdate=[y+1,y,y+1];
        case 2
            xupdate=[x+1,x+1,x];
            yupdate=[y,y,y+1];
        case 3        
            xupdate=[x+1,x+1,x+1];
            yupdate=[y,y,y];
        case 4
            xupdate=[x+1,x,x+1];
            yupdate=[y,y-1,y];
        case 5
            xupdate=[x,x,x+1];
            yupdate=[y-1,y-1,y];
        case 6
            xupdate=[x,x,x];
            yupdate=[y-1,y-1,y-1];
        case 7
            xupdate=[x,x-1,x];
            yupdate=[y-1,y,y-1];
        case 8
            xupdate=[x-1,x-1,x];
            yupdate=[y,y,y-1];
        case 9
            xupdate=[x-1,x-1,x-1];
            yupdate=[y,y,y];
        case 10
            xupdate=[x-1,x,x-1];
            yupdate=[y,y+1,y];
        case 11
            xupdate=[x,x,x-1];
            yupdate=[y+1,y+1,y];
    end
elseif ((a=="b")||(a=="bl")||(a=="br")) %move backward
    switch h
        case 0
            xupdate=[x,x,x];
            yupdate=[y-1,y-1,y-1];
        case 1
            xupdate=[x,x-1,x];
            yupdate=[y-1,y,y-1];
        case 2
            xupdate=[x-1,x-1,x];
            yupdate=[y,y,y-1];
        case 3        
            xupdate=[x-1,x-1,x-1];
            yupdate=[y,y,y];
        case 4
            xupdate=[x-1,x,x-1];
            yupdate=[y,y+1,y];
        case 5
            xupdate=[x,x,x-1];
            yupdate=[y+1,y+1,y];
        case 6
            xupdate=[x,x,x];
            yupdate=[y+1,y+1,y+1];
        case 7
            xupdate=[x,x+1,x];
            yupdate=[y+1,y,y+1];
        case 8
            xupdate=[x+1,x+1,x];
            yupdate=[y,y,y+1];
        case 9
            xupdate=[x+1,x+1,x+1];
            yupdate=[y,y,y];
        case 10
            xupdate=[x+1,x,x+1];
            yupdate=[y,y-1,y];
        case 11
            xupdate=[x,x,x+1];
            yupdate=[y-1,y-1,y];
    end
end


xupdate=xupdate+(xupdate<0)-(xupdate>5);
yupdate=yupdate+(yupdate<0)-(yupdate>5);


if sprime(1)==xupdate(1) && sprime(2)==yupdate(1) && sprime(3)==hupdate(1)
    P_saSPrime=P_saSPrime+p(1);
end
if sprime(1)==xupdate(2) && sprime(2)==yupdate(2) && sprime(3)==hupdate(2)
    P_saSPrime=P_saSPrime+p(2);
end
if sprime(1)==xupdate(3) && sprime(2)==yupdate(3) && sprime(3)==hupdate(3) 
    P_saSPrime=P_saSPrime+p(3);
end
end