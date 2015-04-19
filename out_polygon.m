function polygon=out_polygon(v,w)
%     v(:,1) = [0 1 3/2 1 0 -1/2 0]; 
%     v(:,2) = [0 0 sqrt(3)/2 sqrt(3) sqrt(3) sqrt(3)/2 0];
%     v(:,1) = v(:,1)+0.5;
% % w(:,1) = [0 1 1 0 0];
% % w(:,2) = [0 0 1 1 0];
%     w(:,1) = [0 1 3/2 1 0 -1/2 0]; 
%     w(:,2) = [0 0 sqrt(3)/2 sqrt(3) sqrt(3) sqrt(3)/2 0];
    w=flipud(w);
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
    a=max(w(:,2));
    ind = find(w(:,2)==a);
    b = max(w(ind,1));
    polygon(1,2)=v(1,2)-a;
    polygon(1,1)=v(1,1)+w(1,1)-b;
    polygon(m+n+1,1)=polygon(1,1);
    polygon(m+n+1,2)=polygon(1,2);
    for i=2:m+n
        polygon(i,1)=polygon(i-1,1)+vector(i-1,1);
        polygon(i,2)=polygon(i-1,2)+vector(i-1,2);
    end
end