function IRB940_RePlot(handles)
    axes(handles.world_axes);
    hg=findobj(gca,'Type','hgtransform');
    
    %Model Component Transfomrations
    Tforms=IRB940_Serial_Structure(handles);

    %Assign Transforms to Objects
    set(hg(17),'Matrix',Tforms.base.stl);
    set(hg(16),'Matrix',Tforms.serial_axis1.stl);
    set(hg(15),'Matrix',Tforms.serial_axis2.stl);
    set(hg(14),'Matrix',Tforms.serial_axis3.stl);
    set(hg(13),'Matrix',Tforms.axis4.stl);
    set(hg(12),'Matrix',Tforms.axis5.stl);
    set(hg(11),'Matrix',Tforms.axis6.stl);
    set(hg(10),'Matrix',Tforms.axis1.cardan.stl);
    set(hg(9),'Matrix',Tforms.axis1.act.stl);
    set(hg(8),'Matrix',Tforms.axis1.rod.stl);    
    set(hg(7),'Matrix',Tforms.axis2.cardan.stl);
    set(hg(6),'Matrix',Tforms.axis2.act.stl);
    set(hg(5),'Matrix',Tforms.axis2.rod.stl);    
    set(hg(4),'Matrix',Tforms.axis3.cardan.stl);
    set(hg(3),'Matrix',Tforms.axis3.act.stl);
    set(hg(2),'Matrix',Tforms.axis3.rod.stl);
    set(hg(1),'Matrix',Tforms.tool.stl);
end