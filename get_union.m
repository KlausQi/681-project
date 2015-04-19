function out_union=get_union(out)
    len = length(out);
    if len == 1
        out_union=out{1};
    else
        temp_union=polygon_union(out{1}(:,1),out{1}(:,2),out{2}(:,1),out{2}(:,2));
        for i=3:len
            temp_union=polygon_union(temp_union(:,1),temp_union(:,2),out{i}(:,1),out{i}(:,2));
        end
        out_union=temp_union;
    end
end