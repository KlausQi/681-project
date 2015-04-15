function [scores] = target(A)

mesh_range=8;
mesh_density=0.1;
x=-mesh_range:mesh_density:mesh_range;
[X,Y] = meshgrid(x,x);

%%
x_background = [0 6 6 0 0];
y_background = [0 0 4.5 4.5 0];
background = inpolygon(X,Y,x_background,y_background);
%%
r=1;
x_polygon = [-r/2 -r -r/2 r/2 r r/2 -r/2]; 
y_polygon = [sqrt(3)/2*r 0 -sqrt(3)/2*r -sqrt(3)/2*r 0 sqrt(3)/2*r sqrt(3)/2*r];


[m,n]=size(A);
scores = zeros(1,n);
k=m/3;
for i=1:n
    score = 0;
    union = 0;
    area = 0;
    for j=1:k;
        [x_after_trans,y_after_trans] = translate(A(3*j-2,i),A(3*j-1,i),A(3*j,i),x_polygon,y_polygon);
        polygon(:,:,j) = inpolygon(X,Y,x_after_trans,y_after_trans);
        area = area + sum(sum(polygon(:,:,j)))*mesh_density*mesh_density;
        union = union | polygon(:,:,j);
        score = score + 100*sum(sum(polygon(:,:,j)-(polygon(:,:,j) & background)))*mesh_density*mesh_density;
    end
    score = score + area - sum(sum(union))*mesh_density*mesh_density;
    scores(1,i)=score;
end

end