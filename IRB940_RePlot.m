function IRB940_RePlot(handles)
    %% Set World Axis
    axes(handles.world_axes);
    
    %% Model Component Transfomrations
    Tforms=IRB940_PSerial_ForwardK(handles);

    %% Assign Transforms to Objects
    hg=findobj(gca,'Type','hgtransform');
    
    set(hg(19),'Matrix',Tforms.base.stl);
    set(hg(18),'Matrix',Tforms.serial_axis1.stl);
    set(hg(17),'Matrix',Tforms.serial_axis2.stl);
    set(hg(16),'Matrix',Tforms.serial_axis3.stl);
    set(hg(15),'Matrix',Tforms.axis4.stl);
    set(hg(14),'Matrix',Tforms.axis5.stl);
    set(hg(13),'Matrix',Tforms.axis6.stl);
    set(hg(12),'Matrix',Tforms.axis1.cardan.stl);
    set(hg(11),'Matrix',Tforms.axis1.act.stl);
    set(hg(10),'Matrix',Tforms.axis1.rod.stl);    
    set(hg(9),'Matrix',Tforms.axis2.cardan.stl);
    set(hg(8),'Matrix',Tforms.axis2.act.stl);
    set(hg(7),'Matrix',Tforms.axis2.rod.stl);    
    set(hg(6),'Matrix',Tforms.axis3.cardan.stl);
    set(hg(5),'Matrix',Tforms.axis3.act.stl);
    set(hg(4),'Matrix',Tforms.axis3.rod.stl);
    set(hg(3),'Matrix',Tforms.tool.stl);
    set(hg(2),'Matrix',Tforms.tool_triad.stl);
    set(hg(1),'Matrix',Tforms.frame.stl);
    

%     axes(handles.world_axes2);
%     
%     hg=findobj(gca,'Type','hgtransform');
%     
%     set(hg(19),'Matrix',Tforms.base.stl);
%     set(hg(18),'Matrix',Tforms.serial_axis1.stl);
%     set(hg(17),'Matrix',Tforms.serial_axis2.stl);
%     set(hg(16),'Matrix',Tforms.serial_axis3.stl);
%     set(hg(15),'Matrix',Tforms.axis4.stl);
%     set(hg(14),'Matrix',Tforms.axis5.stl);
%     set(hg(13),'Matrix',Tforms.axis6.stl);
%     set(hg(12),'Matrix',Tforms.axis1.cardan.stl);
%     set(hg(11),'Matrix',Tforms.axis1.act.stl);
%     set(hg(10),'Matrix',Tforms.axis1.rod.stl);    
%     set(hg(9),'Matrix',Tforms.axis2.cardan.stl);
%     set(hg(8),'Matrix',Tforms.axis2.act.stl);
%     set(hg(7),'Matrix',Tforms.axis2.rod.stl);    
%     set(hg(6),'Matrix',Tforms.axis3.cardan.stl);
%     set(hg(5),'Matrix',Tforms.axis3.act.stl);
%     set(hg(4),'Matrix',Tforms.axis3.rod.stl);
%     set(hg(3),'Matrix',Tforms.tool.stl);
%     set(hg(2),'Matrix',Tforms.tool_triad.stl);
%     set(hg(1),'Matrix',Tforms.frame.stl);
    
end