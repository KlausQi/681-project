%%
Population=500;
Elitism=10;
crossoverrate=0.9;
mutationrate=0.4;
tournament=10;
Termination=500;

%%
p1=zeros(24,1);
p2=zeros(24,1);
child1=zeros(24,1);
child2=zeros(24,1);
gene_map=zeros(24,Population);
new_map=zeros(24,Population);

gene_map=rand(24,Population);

for iteration=1:Termination
    score_matrix=target(gene_map);
    [score_matrix,ind_1]=sort(score_matrix);
    if score_matrix(1,1)<=0.1
        solution=gene_map(:,ind_1(1,1));
        score=score_matrix(1,1);
        break
    end
    solution=gene_map(:,ind_1(1,1));
    score=score_matrix(1,1);
    score_iteration(iteration,1)=score;
    gene_map=gene_map(:,ind_1);
    
    
    temp=sort(randi([1,Population],tournament,(Population-Elitism)/2));
    for i=1:Elitism
        index(1,i)=i;
    end
    for i=1:(Population-Elitism)/2
        index(1,2*i+Elitism-1)=temp(1,i);
        index(1,2*i+Elitism)=temp(2,i);
    end
    
    for i=1:Population/2
        p1=gene_map(:,index(1,2*i-1));
        p2=gene_map(:,index(1,2*i));
        if rand()<crossoverrate
            mask=randi([0,1],24,1);
            child1=p1.*mask+p2.*(~mask);
            child2=p1.*(~mask)+p2.*(mask);
        else
            child1=p1;
            child2=p2;
        end
        
        if rand()<mutationrate
            temp_1=randi([1,24],3,1);
            child1(temp_1,1)=rand();
        end
        if rand()<mutationrate
            temp_2=randi([1,24],3,1);
            child2(temp_2,1)=rand();
        end
        new_map(:,2*i-1)=child1;
        new_map(:,2*i)=child2;
        
    end
    
    gene_map=new_map;
    
end