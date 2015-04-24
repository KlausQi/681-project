function new_v = concave(v)
m = length(v(:,1)) - 1;
for i = 1:m
    vector(i,1) = v(i+1,1) - v(i,1);
    vector(i,2) = v(i+1,2) - v(i,2);
end
n = 2;
for i = 1:m-1
    if vector(i,1) * vector(i+1,2) - vector(i,2) * vector(i+1,1) > 0
        new_v(n,1) = v(i+1,1);
        new_v(n,2) = v(i+1,2);
        %new_v(1,1) = new_v(n,1);
        %new_v(1,2) = new_v(n,2);
        n = n+1;
    end
end
if vector(m,1) * vector(1,2) - vector(m,2) * vector(1,1) > 0
new_v(n,1) = v(1,1);
new_v(n,2) = v(1,2);
new_v(1,1) = new_v(n,1);
new_v(1,2) = new_v(n,2);
end
end
