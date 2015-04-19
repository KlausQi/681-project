clear all;
clc;
v(:,1) = [0 1 3/2 1 0 -1/2 0]; 
v(:,2) = [0 0 sqrt(3)/2 sqrt(3) sqrt(3) sqrt(3)/2 0];
v(:,1) = v(:,1)+0.5;
% w(:,1) = [0 1 1 0 0];
% w(:,2) = [0 0 1 1 0];
w(:,1) = [0 1 3/2 1 0 -1/2 0]; 
w(:,2) = [0 0 sqrt(3)/2 sqrt(3) sqrt(3) sqrt(3)/2 0];

m=length(v(:,1))-1;
n=length(w(:,1))-1;

vector=zeros(m+n,2);
for i=1:m
    vector(i,1)=v(i+1,1)-v(i,1);
    vector(i,2)=v(i+1,2)-v(i,2);
end
for i=m+1:m+n
    vector(i,1)=w(i+1-m,1)-w(i-m,1);
    vector(i,2)=w(i+1-m,2)-w(i-m,2);
end
angle = zeros(m+n,1);
for i=1:m+n
    angle(i)=ang(vector(i,:));
end
[angle,ind]=sort(angle);
vector=vector(ind,:);

polygon=zeros(m+n+1,2);
polygon(1,1)=v(1,1);
polygon(1,2)=v(1,2);
polygon(m+n+1,1)=v(1,1);
polygon(m+n+1,2)=v(1,2);
for i=2:m+n
    polygon(i,1)=polygon(i-1,1)+vector(i-1,1);
    polygon(i,2)=polygon(i-1,2)+vector(i-1,2);
end
figure
hold on
plot(polygon(:,1),polygon(:,2))
plot(polygon(:,1),polygon(:,2)+sqrt(3))
plot(v(:,1),v(:,2))

% i=1;
% j=1;
% counter = 1;
% m=length(v(:,1))-1;
% n=length(w(:,1))-1;
% while i<m || j<n
%     counter=counter+1;
%     
%     res(counter,1)=v(i,1)+w(j,1);
%     res(counter,2)=v(i,2)+w(j,2);
%     temp_v1 = [v(i,1) v(i,2)];
%     temp_v2 = [v(i+1,1) v(i+1,2)];
%     temp_w1 = [w(j,1) w(j,2)];
%     temp_w2 = [w(j+1,1) w(j+1,2)];
%     temp_angv = angle(temp_v1,temp_v2);
%     temp_angw = angle(temp_w1,temp_w2);
%     if temp_angv<temp_angw
%         i=i+1;
%     else if temp_angv>temp_angw
%             j=j+1;
%         else 
%             i=i+1;
%             j=j+1;
%         end
%     end
%     if i>m
%         i=m;
%     end
%     if j>n
%         j=n;
%     end
%     
% end
