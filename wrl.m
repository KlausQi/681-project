fid = fopen('demo.wrl', 'w'); 
fprintf(fid, '#VRML V2.0 utf8\n');
fprintf(fid, 'Background{ skyColor 1 1 1 }\n'); 
fprintf(fid, 'NavigationInfo{ type "EXAMINE"}\n');
fprintf(fid, 'Shape{ \n');
    fprintf(fid, '\t geometry IndexedLineSet{ \n');
    fprintf(fid, '\t\t coord Coordinate{ point[\n'); 
    fprintf(fid, '\t\t\t0 0 0, 10 0 0, 10 10 0, 0 10 0\n');
    fprintf(fid, '\t\t] }\n');
    fprintf(fid, 'coordIndex[\n'); 
    fprintf(fid, '\t 0 1 -1, 1 2 -1, 2 3 -1, 3 0 -1');
    fprintf(fid, '\t\t]\n');
    fprintf(fid,'color Color{ color [0 0 0, 0 0 0, 0 0 0, 0 0 0]}\n');
    fprintf(fid,'}\n}\n'); 
for i=1:length(list)
    fprintf(fid, 'Shape{ \n');
    fprintf(fid, '\t geometry IndexedFaceSet{ \n');
    fprintf(fid, '\t\t coord Coordinate{ point[\n'); 
   for j=1:length(res{i}(:,1));
        fprintf(fid, '\t\t\t %f %f 0,\n', res{i}(j,1), res{i}(j,2));
   end 
    fprintf(fid, '\t\t] }\n');
    fprintf(fid, 'coordIndex[\n'); 
    for k=1:length(res{i}(:,1))-1;
        fprintf(fid, '\t%d,', k-1);
    end
    fprintf(fid, '\t\t]\n');
    fprintf(fid,'\t}\n');
    r = rand(3,1);
    fprintf(fid,'appearance Appearance{ material Material{ diffuseColor %f %f %f}}\n',r(1,1), r(2,1), r(3,1));
    fprintf(fid,'}\n'); 
end