function handles=prev_position(handles)
    index=handles.file_data.variables.index;
    index=index-1;
    joint_positions=handles.file_data.variables.filtered_joint_positions;
    
    handles.IRB940.axis1.q1=joint_positions(index,1);
    handles.IRB940.axis2.q2=joint_positions(index,2);
    handles.IRB940.axis3.q3=joint_positions(index,3);
    handles.IRB940.axis4.q4=joint_positions(index,4);
    handles.IRB940.axis5.q5=joint_positions(index,5);
    handles.IRB940.axis6.q6=joint_positions(index,6);
    
    handles=IRB940_ForwardKinematics(handles);

    handles.file_data.variables.index=index;
end