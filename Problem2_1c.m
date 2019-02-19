function [Psa] = Problem2_1c(pe,s,a,sp)
a=lower(a);
Psa=0; 
x=s(1); y=s(2); h=s(3); 

update = zeros(3);
update(1,:)= x;
update(2,:)= y;
update(3,:)= h;
p=[0,0,0];


if a=="standby"
    update(3,:)=[mod(h,12),0,0]; 
    p=[1,0,0];
end


if ((a=="leftforward") || (a=="leftbackward"))
    update(3,:)=[mod(h-1,12),mod(h,12),mod(h-2,12)]; 
    p=[1-2*pe,pe,pe]; 
elseif ((a=="rightforward")||(a=="rightbackward"))
    update(3,:)=[mod(h+1,12),mod(h+2,12),mod(h,12)]; 
    p=[1-2*pe,pe,pe]; 
elseif ((a=="forward") || (a=="backward")) 
    update(3,:)=[mod(h,12),mod(h+1,12),mod(h-1,12)];
    p=[1-2*pe,pe,pe]; 
end



if ((a=="forward")||(a=="leftforward")||(a=="rightforward")) 
    switch h
        case 0
            update(1,:)=[x,x,x];
            update(2,:)=[y+1,y+1,y+1];
        case 1
            update(1,:)=[x,x+1,x];
            update(2,:)=[y+1,y,y+1];
        case 2
            update(1,:)=[x+1,x+1,x];
            update(2,:)=[y,y,y+1];
        case 3        
            update(1,:)=[x+1,x+1,x+1];
            update(2,:)=[y,y,y];
        case 4
            update(1,:)=[x+1,x,x+1];
            update(2,:)=[y,y-1,y];
        case 5
            update(1,:)=[x,x,x+1];
            update(2,:)=[y-1,y-1,y];
        case 6
            update(1,:)=[x,x,x];
            update(2,:)=[y-1,y-1,y-1];
        case 7
            update(1,:)=[x,x-1,x];
            update(2,:)=[y-1,y,y-1];
        case 8
            update(1,:)=[x-1,x-1,x];
            update(2,:)=[y,y,y-1];
        case 9
            update(1,:)=[x-1,x-1,x-1];
            update(2,:)=[y,y,y];
        case 10
            update(1,:)=[x-1,x,x-1];
            update(2,:)=[y,y+1,y];
        case 11
            update(1,:)=[x,x,x-1];
            update(2,:)=[y+1,y+1,y];
    end
    
elseif ((a=="backward")||(a=="leftbackward")||(a=="rightbackward")) 
    switch h
        case 0
            update(1,:)=[x,x,x];
            update(2,:)=[y-1,y-1,y-1];
        case 1
            update(1,:)=[x,x-1,x];
            update(2,:)=[y-1,y,y-1];
        case 2
            update(1,:)=[x-1,x-1,x];
            update(2,:)=[y,y,y-1];
        case 3        
            update(1,:)=[x-1,x-1,x-1];
            update(2,:)=[y,y,y];
        case 4
            update(1,:)=[x-1,x,x-1];
            update(2,:)=[y,y+1,y];
        case 5
            update(1,:)=[x,x,x-1];
            update(2,:)=[y+1,y+1,y];
        case 6
            update(1,:)=[x,x,x];
            update(2,:)=[y+1,y+1,y+1];
        case 7
            update(1,:)=[x,x+1,x];
            update(2,:)=[y+1,y,y+1];
        case 8
            update(1,:)=[x+1,x+1,x];
            update(2,:)=[y,y,y+1];
        case 9
            update(1,:)=[x+1,x+1,x+1];
            update(2,:)=[y,y,y];
        case 10
            update(1,:)=[x+1,x,x+1];
            update(2,:)=[y,y-1,y];
        case 11
            update(1,:)=[x,x,x+1];
            update(2,:)=[y-1,y-1,y];
    end
end


update(1,:)=update(1,:)+(update(1,:)<0)-(update(1,:)>5);
update(2,:)=update(2,:)+(update(2,:)<0)-(update(2,:)>5);

if sp(1)==update(1,1) && sp(2)==update(2,1) && sp(3)==update(3,1) 
    Psa=Psa+p(1);
end

if sp(1)==update(1,2) && sp(2)==update(2,2) && sp(3)==update(3,2)
    Psa=Psa+p(2);
end

if sp(1)==update(1,3) && sp(2)==update(2,3) && sp(3)==update(3,3)
    Psa=Psa+p(3);
end

end
