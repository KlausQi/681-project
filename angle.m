function res = angle(v1,v2)
    v1(1,3)=0;
    v2(1,3)=0;
    temp = cross(v1,v2);
    res=asin(temp(1,3)/norm(v1)/norm(v2));
end