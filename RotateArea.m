function Rec_coord=RotateArea (x,y)


% x=[1;2;0;1];
% y=[0;1;1;0];
n=size(x,1)-1;

polygon(:,1)=x;
polygon(:,2)=y;
polygon(:,3)=ones(n+1,1);
polygon=polygon';

v_fit=zeros(n,2);
RotateAngle=zeros(n,1);

area_min=100000000000;
for i=1:n
    v_fit(i,1)=x(i+1)-x(i);
    v_fit(i,2)=y(i+1)-y(i);
    RotateAngle(i)=-ang(v_fit(i,:));
    af=RotateAngle(i);
    RotateMatrix=[cos(af),-sin(af),0;sin(af),cos(af),0;0,0,1];
    polygon_new=RotateMatrix*polygon;
    length=max(polygon_new(1,:))-min(polygon_new(1,:));
    height=max(polygon_new(2,:))-min(polygon_new(2,:));
    area_new = length*height;
    if area_new < area_min
        area_min=area_new;
        x_fit=[min(polygon_new(1,:));min(polygon_new(1,:))+length;min(polygon_new(1,:))+length;min(polygon_new(1,:));min(polygon_new(1,:))]';
        y_fit=[min(polygon_new(2,:));min(polygon_new(2,:));min(polygon_new(2,:))+height;min(polygon_new(2,:))+height;min(polygon_new(2,:))]';
        Rec_coord(:,1)=x_fit-min(x_fit);
        Rec_coord(:,2)=y_fit;
    end
   
end



end