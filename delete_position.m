function handles=delete_position(handles)
    index=handles.file_data.variables.index;
    joint_positions=handles.file_data.variables.spatial_filtered_positions; 
    
    handles.file_data.variables.spatial_filtered_positions(index,:)=[];
    
    fprintf("Position %i Deleted\n",index);
    
    handles.IRB940.serial_axis1.sq1=joint_positions(index+1,1);
    handles.IRB940.serial_axis2.sq2=joint_positions(index+1,2);
    handles.IRB940.serial_axis3.sq3=joint_positions(index+1,3);
    handles.IRB940.axis4.q4=joint_positions(index+1,4);
    handles.IRB940.axis5.q5=joint_positions(index+1,5);
    handles.IRB940.axis6.q6=joint_positions(index+1,6);
    
    
    IRB940_RePlot(handles);
    
    
    handles.file_data.variables.index=index;
end
