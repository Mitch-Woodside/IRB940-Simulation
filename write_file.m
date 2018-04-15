function write_file(handles)
    file=handles.file_data.file;
    path=handles.file_data.path;
    filtered_joint_positions=handles.file_data.variables.filtered_joint_positions;

    filepath=fullfile(path,'filtered_joint_positions(robot).mat');
    save(filepath,'filtered_joint_positions');
    disp(['User saved: ', filepath]);
end