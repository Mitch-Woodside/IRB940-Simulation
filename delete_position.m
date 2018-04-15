function handles=delete_position(handles)
    index=handles.file_data.variables.index;
    
    handles.file_data.variables.filtered_joint_positions(index,:)=[];
    
    fprintf("Position %i Deleted\n",index);
    
    handles.IRB940.axis1.q1=handles.file_data.variables.filtered_joint_positions(index,1);
    handles.IRB940.axis2.q2=handles.file_data.variables.filtered_joint_positions(index,2);
    handles.IRB940.axis3.q3=handles.file_data.variables.filtered_joint_positions(index,3);
    handles.IRB940.axis4.q4=handles.file_data.variables.filtered_joint_positions(index,4);
    handles.IRB940.axis5.q5=handles.file_data.variables.filtered_joint_positions(index,5);
    handles.IRB940.axis6.q6=handles.file_data.variables.filtered_joint_positions(index,6);
    
    handles=IRB940_ForwardKinematics(handles);
    
    handles.file_data.variables.index=index;


end
