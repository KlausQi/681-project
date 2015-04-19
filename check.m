function res=check(out,poly,bx,by)
    sol = [100 100];
    for i=1:length(out)
        temp(:,1)=out(i,1)+poly(:,1);
        temp(:,2)=out(i,2)+poly(:,2);
        if min(temp(:,1))<0
            continue;
        end
        if max(temp(:,1))>bx
            continue;
        end
        if min(temp(:,2))<0
            continue;
        end
        if max(temp(:,2))>by
            continue;
        end
        
        if sol(1,1)>out(i,1)
            sol(1,1)=out(i,1);
            sol(1,2)=out(i,2);
        else if sol(1,1)==out(i,1)
                sol(1,2)=min(out(i,2),sol(1,2));
            end
        end 
    end
    res(:,1)=poly(:,1)+sol(1,1);
    res(:,2)=poly(:,2)+sol(1,2);
end