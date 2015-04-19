function res=ang(v)
    x=v(1,1);
    y=v(1,2);
    if x==0
        if y==0
            res=0;
        end
        if y>0
            res=pi/2;
        end
        if y<0
            res=3*pi/2;
        end
    else if x>0
            if y==0
                res=0;
            end
            if y>0
                res = atan(y/x);
            end
            if y<0
                res = 2*pi+atan(y/x);
            end
        else
            if y==0
                res=pi;
            end
            if y>0
                res = pi+atan(y/x);
            end
            if y<0
                res = pi+atan(y/x);
            end
        end
    end
end