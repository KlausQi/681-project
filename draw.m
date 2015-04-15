function draw(in)

r=1;
x_polygon = [-r/2 -r -r/2 r/2 r r/2 -r/2]; 
y_polygon = [sqrt(3)/2*r 0 -sqrt(3)/2*r -sqrt(3)/2*r 0 sqrt(3)/2*r sqrt(3)/2*r];
    figure
    hold on
    n = length(in)/3;
    for i=1:n
        [x_solution,y_solution] = translate(in(3*i-2),in(3*i-1),in(3*i),x_polygon,y_polygon);
        plot(x_solution,y_solution);
    end
end