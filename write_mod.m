function write_mod(handles)
    filtered_joint_positions=handles.file_data.variables.filtered_joint_positions;

    %% OUTPUT FILTERED JOINT POSITIONS TO .MOD FILE
    path_settings.speed=100;
    path_settings.zone="fine";
    path_settings.wobj="wobj0";
    path_settings.tool="tool0";

    path=jointtarget(filtered_joint_positions);

    Module_Output(path,path_settings);
end