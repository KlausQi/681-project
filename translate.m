function [X_res,Y_res]=translate(x,y,theta,X_original,Y_original)
    x = 6*x;
    y = 4.5*y;
    theta = -pi + 2*pi*theta;
    M = zeros(3,3);
    M(3,3)=1;
    M(1,1)=cos(theta);
    M(1,2)=-sin(theta);
    M(1,3)=x;
    M(2,1)=sin(theta);
    M(2,2)=cos(theta);
    M(2,3)=y;
    len = length(X_original);
    X_res = zeros(1,len);
    Y_res = zeros(1,len);
    for i=1:len
        temp=ones(3,1);
        temp(1,1)=X_original(i);
        temp(2,1)=Y_original(i);
        temp_ans = M*temp;
        X_res(i)=temp_ans(1,1);
        Y_res(i)=temp_ans(2,1);
    end
end