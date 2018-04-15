function write_mod(handles)
    simulation_filtered_positions=handles.file_data.variables.spatial_filtered_positions;

    %% OUTPUT FILTERED JOINT POSITIONS TO .MOD FILE
    path_settings.speed=100;
    path_settings.zone="fine";
    path_settings.wobj="wobj0";
    path_settings.tool="tool0";

    path=jointtarget(simulation_filtered_positions);

    Module_Output(path,path_settings);
end