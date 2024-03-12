% Save the solution to vti files

fprintf("Generating ParaView output...\n");

dir_name = "paraview_files";

if exist(dir_name, "dir") == 0
    mkdir(dir_name);
end

write_brain_data;

for i=1:steps+1
    Umat=reshape(U(:,i),[nelx+1,nely+1,nelz+1]);
    write_tumor_data;
    show_progress(i, steps + 1);
end