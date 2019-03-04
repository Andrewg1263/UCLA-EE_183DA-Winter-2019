function MinD = find_closestnode(A,T)% problem 2.2b
temp = 10^10;
for i=1:length(A)
    d = pdist([A(i,1),A(i,2);T]);
    if temp > d
        temp = d;
        min = A(i,:);
    end
end
MinD = [min,d];
end
