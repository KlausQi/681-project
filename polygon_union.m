function union_points = polygon_union(poly1_x,poly1_y,poly2_x,poly2_y)
S(:,1) = [poly1_x;poly2_x]; % ??????????? S ???????
S(:,2) = [poly1_y;poly2_y];
num = size(poly1_x,1)+size(poly2_x,1)+1;
for i = 1:size(poly1_x,1)-1
    for j = 1:size(poly2_x,1)-1
        X1 = [poly1_x(i);poly1_x(i+1)];
        Y1 = [poly1_y(i);poly1_y(i+1)];
        X2 = [poly2_x(j);poly2_x(j+1)];
        Y2 = [poly2_y(j);poly2_y(j+1)];
        [intspoint_x,intspoint_y] = polyxpoly(X1,Y1,X2,Y2); % ????????x,y??
        if length(intspoint_x)==1 % ??????????????????????????x,y????S?
            S(num,1) = intspoint_x;
            S(num,2) = intspoint_y;
            num = num + 1; % ?? S ???????
        end
    end
end
IN = inpolygon(S(:,1),S(:,2),poly1_x,poly1_y);
S(IN == 0,:) = []; % ????????? A ??????
IN = inpolygon(S(:,1),S(:,2),poly2_x,poly2_y);
S(IN == 0,:) = []; % ????????? B ??????
X = S(:,1); % ??????????????
Y = S(:,2);
k = convhull(X,Y); % ??????????????????????????? convhull ????????
ints_x = X(k);
ints_y = Y(k);

count=1;
for i=1:length(poly1_x)
    flag=0;
    for j=1:length(ints_x)
        if poly1_x(i)==ints_x(j) && poly1_y(i)==ints_y(j)
            flag=1;
            break;
        end
    end
    if flag==0
        union_points(count,1)=poly1_x(i);
        union_points(count,2)=poly1_y(i);
        count=count+1;
    end
end
for i=1:length(poly2_x)
    flag=0;
    for j=1:length(ints_x)
        if poly2_x(i)==ints_x(j) && poly2_y(i)==ints_y(j)
            flag=1;
            break;
        end
    end
    if flag==0
        union_points(count,1)=poly2_x(i);
        union_points(count,2)=poly2_y(i);
        count=count+1;
    end
end
temp=convhull(union_points(:,1),union_points(:,2));
union_points=union_points(temp,:);
% plot(union_points(:,1),union_points(:,2)) % ??
end