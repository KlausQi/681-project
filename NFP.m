clear all;
clc;
o{1}(:,1) = [0 1 3/2 1 0 -1/2 0]; 
o{1}(:,2) = [0 0 sqrt(3)/2 sqrt(3)+1 sqrt(3)+1 sqrt(3)/2 0];
o{2}(:,1) = [0 1 1 0 0];
o{2}(:,2) = [0 0 1 1 0];
o{3}(:,1) = [0 4 3 2 1 0];
o{3}(:,2) = [0 0 1 0.5 1 0];

for i=1:length(o)
    temp1 = concave(o{i});
    temp2 = RotateArea(temp1(:,1),temp1(:,2));
    v{i} = temp2;
end

list=[1 1 1 1 3 3 3 2 2];

res{1}(:,1)=v{list(1)}(:,1)-min(v{list(1)}(:,1));
res{1}(:,2)=v{list(1)}(:,2)-min(v{list(1)}(:,2));
figure 
axis equal
hold on
%plot(out(:,1),out(:,2))
k=1;
col=1;
lb=0;
plot(o{list(1)}(:,1)-min(o{list(1)}(:,1)),o{list(1)}(:,2)-min(o{list(1)}(:,2)));
for i=2:length(list)
    clear out;
    for j=k:i-1
        out{j-k+1} = out_polygon(res{j},v{list(i)});
    end
    out_union = get_union(out);
    if (max(out_union(:,2))+max(v{list(i)}(:,2)))>10
        col=col+1;
        k=i;
        for ii=1:i-1
            lb=max(lb,max(res{ii}(:,1)));
        end
        res{i}(:,1)=v{list(1)}(:,1)-min(v{list(1)}(:,1))+lb;
        res{i}(:,2)=v{list(1)}(:,2)-min(v{list(1)}(:,2));
        sol=[lb 0];
    else
        [res{i},sol]=check(out_union,v{list(i)},10,10,lb);
    end

    plot(o{list(i)}(:,1)+sol(1,1)-min(o{list(1)}(:,1)),o{list(i)}(:,2)+sol(1,2)-min(o{list(1)}(:,2)));
end
%  plot(out_union(:,1),out_union(:,2))