clear all;
clc;
v{1}(:,1) = [0 1 3/2 1 0 -1/2 0]; 
v{1}(:,2) = [0 0 sqrt(3)/2 sqrt(3) sqrt(3) sqrt(3)/2 0];
v{2}(:,1) = [0 1 1 0 0];
v{2}(:,2) = [0 0 1 1 0];

list=[1 1 2 2 1 1];

res{1}(:,1)=v{list(1)}(:,1)-min(v{list(1)}(:,1));
res{1}(:,2)=v{list(1)}(:,2)-min(v{list(1)}(:,2));
figure 
hold on
%plot(out(:,1),out(:,2))
plot(res{1}(:,1),res{1}(:,2))
for i=2:length(list)
    for j=1:i-1
        out{j} = out_polygon(res{j},v{list(i)});
    end
    out_union = get_union(out);
    %plot(out(:,1),out(:,2))
    res{i}=check(out_union,v{list(i)},100,100);
    plot(res{i}(:,1),res{i}(:,2));
end