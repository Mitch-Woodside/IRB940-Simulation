function file_data=load_file(handles)
    [file,path] = uigetfile('*.mat');
    if isequal(file,0)
       disp('User selected Cancel');
       file_data.variables=NaN;
    else
       disp(['User selected ', fullfile(path,file)]);
       fileID=fullfile(path,file);
       file_data.variables=load(fileID,'spatial_filtered_positions');
       file_data.variables.index=0;
       file_data.file=file;
       file_data.path=path;
    end
    
end