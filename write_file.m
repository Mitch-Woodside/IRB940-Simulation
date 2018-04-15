function write_file(handles)
    file=handles.file_data.file;
    path=handles.file_data.path;
    simulation_filtered_positions=handles.file_data.variables.spatial_filtered_positions;

    filepath=fullfile(path,'simulation_filtered_positions.mat');
    save(filepath,'simulation_filtered_positions');
    disp(['User saved: ', filepath]);
end