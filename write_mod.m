function write_mod(handles)
    
    sq=handles.file_data.variables.spatial_filtered_positions(:,1:3);
    
    q=IRB940_Serial2Parallel(sq(:,1),sq(:,2),sq(:,3));
    
    simulation_filtered_positions(:,1:3)=q(:,1:3);
    simulation_filtered_positions(:,4:6)=handles.file_data.variables.spatial_filtered_positions(:,4:6);

    %% OUTPUT FILTERED JOINT POSITIONS TO .MOD FILE
    path_settings.speed=100;
    path_settings.zone="fine";
    path_settings.wobj="wobj0";
    path_settings.tool="tool0";

    path=jointtarget(simulation_filtered_positions);

    Module_Output(path,path_settings);
end