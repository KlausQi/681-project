clear all;
clc;
v{1}(:,1) = [0 1 3/2 1 0 -1/2 0]; 
v{1}(:,2) = [0 0 sqrt(3)/2 sqrt(3)+1 sqrt(3)+1 sqrt(3)/2 0];
v{2}(:,1) = [0 1 1 0 0];
v{2}(:,2) = [0 0 1 1 0];
v{3}(:,1) = [0 2 2 0 0];
v{3}(:,2) = [0 0 2 2 0];
list=[3 3 3 2 2];

res{1}(:,1)=v{list(1)}(:,1)-min(v{list(1)}(:,1));
res{1}(:,2)=v{list(1)}(:,2)-min(v{list(1)}(:,2));
figure 
axis equal
hold on
%plot(out(:,1),out(:,2))
k=1;
col=1;
lb=0;
plot(res{1}(:,1),res{1}(:,2))
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
    else
        res{i}=check(out_union,v{list(i)},10,10,lb);
    end
%     if(res{i}(1,2)<res{i-1}(1,2))
%         col=col+1;
%         k=i;
%         for ii=1:i-1
%             lb=max(lb,max(res{ii}(:,1)));
%         end
%         if lb>min(res{i}(:,1))
%             res{i}(:,1)=v{list(1)}(:,1)-min(v{list(1)}(:,1))+lb;
%             res{i}(:,2)=v{list(1)}(:,2)-min(v{list(1)}(:,2));
%         end
%     end
    plot(res{i}(:,1),res{i}(:,2));
end
%  plot(out_union(:,1),out_union(:,2))