function IRB940_Plot(handles)
    axes(handles.world_axes);
    cla
    
    hold all
    base=patch('Vertices',handles.IRB940.base.vertices,'Faces',handles.IRB940.base.faces,'FaceColor',[1 0.5 0],'EdgeColor','none','FaceLighting','flat');
    serial_axis1=patch('Vertices',handles.IRB940.serial_axis1.vertices,'Faces',handles.IRB940.serial_axis1.faces,'FaceColor',[1 0.5 0],'EdgeColor','none','FaceLighting','flat');
    serial_axis2=patch('Vertices',handles.IRB940.serial_axis2.vertices,'Faces',handles.IRB940.serial_axis2.faces,'FaceColor',[1 0.5 0],'EdgeColor','none','FaceLighting','flat');
    serial_axis3=patch('Vertices',handles.IRB940.serial_axis3.vertices,'Faces',handles.IRB940.serial_axis3.faces,'FaceColor',[1 0.5 0],'EdgeColor','none','FaceLighting','flat');
    axis4=patch('Vertices',handles.IRB940.axis4.vertices,'Faces',handles.IRB940.axis4.faces,'FaceColor',[1 0.5 0],'EdgeColor','none','FaceLighting','flat');
    axis5=patch('Vertices',handles.IRB940.axis5.vertices,'Faces',handles.IRB940.axis5.faces,'FaceColor',[1 0.5 0],'EdgeColor','none','FaceLighting','flat');
    axis6=patch('Vertices',handles.IRB940.axis6.vertices,'Faces',handles.IRB940.axis6.faces,'FaceColor',[0.5 0.5 0.5],'EdgeColor','none','FaceLighting','flat');
    axis1_cardan=patch('Vertices',handles.IRB940.axis1.cardan.vertices,'Faces',handles.IRB940.axis1.cardan.faces,'FaceColor',[1 0.5 0],'EdgeColor','none','FaceLighting','flat');
    axis1_act=patch('Vertices',handles.IRB940.axis1.act.vertices,'Faces',handles.IRB940.axis1.act.faces,'FaceColor',[1 0.5 0],'EdgeColor','none','FaceLighting','flat');
    axis1_rod=patch('Vertices',handles.IRB940.axis1.rod.vertices,'Faces',handles.IRB940.axis1.rod.faces,'FaceColor',[0.5 0.5 0.5],'EdgeColor','none','FaceLighting','flat');
    axis2_cardan=patch('Vertices',handles.IRB940.axis2.cardan.vertices,'Faces',handles.IRB940.axis2.cardan.faces,'FaceColor',[1 0.5 0],'EdgeColor','none','FaceLighting','flat');
    axis2_act=patch('Vertices',handles.IRB940.axis2.act.vertices,'Faces',handles.IRB940.axis2.act.faces,'FaceColor',[1 0.5 0],'EdgeColor','none','FaceLighting','flat');
    axis2_rod=patch('Vertices',handles.IRB940.axis1.rod.vertices,'Faces',handles.IRB940.axis1.rod.faces,'FaceColor',[0.5 0.5 0.5],'EdgeColor','none','FaceLighting','flat');
    axis3_cardan=patch('Vertices',handles.IRB940.axis3.cardan.vertices,'Faces',handles.IRB940.axis3.cardan.faces,'FaceColor',[1 0.5 0],'EdgeColor','none','FaceLighting','flat');
    axis3_act=patch('Vertices',handles.IRB940.axis3.act.vertices,'Faces',handles.IRB940.axis3.act.faces,'FaceColor',[1 0.5 0],'EdgeColor','none','FaceLighting','flat');
    axis3_rod=patch('Vertices',handles.IRB940.axis1.rod.vertices,'Faces',handles.IRB940.axis1.rod.faces,'FaceColor',[0.5 0.5 0.5],'EdgeColor','none','FaceLighting','flat');
    tool=patch('Vertices',handles.IRB940.tool.vertices,'Faces',handles.IRB940.tool.faces,'FaceColor',[.5 0.5 .5],'EdgeColor','none','FaceLighting','flat');
    frame=patch('Vertices',handles.IRB940.frame.vertices,'Faces',handles.IRB940.frame.faces,'FaceColor',[.5 0.5 .5],'EdgeColor','none','FaceLighting','flat');
    
    %Tool Triad
    tool_triad(1)=plot3([.125,0],[0,0],[0,0],'LineWidth',3,'Color','r');
    tool_triad(2)=plot3([0,0],[.125,0],[0,0],'LineWidth',3,'Color','g');
    tool_triad(3)=plot3([0,0],[0,0],[.125,0],'LineWidth',3,'Color','b');

    %Patch Appearance
    camlight('headlight');
    material('dull');
    
    %Create transform object for each model component
    base_frame=hgtransform('Parent',handles.world_axes);
    serial_axis1_frame=hgtransform('Parent',handles.world_axes);
    serial_axis2_frame=hgtransform('Parent',handles.world_axes);
    serial_axis3_frame=hgtransform('Parent',handles.world_axes);
    axis4_frame=hgtransform('Parent',handles.world_axes);
    axis5_frame=hgtransform('Parent',handles.world_axes);
    axis6_frame=hgtransform('Parent',handles.world_axes);
    axis1_frame_cardan=hgtransform('Parent',handles.world_axes);
    axis1_frame_act=hgtransform('Parent',handles.world_axes);
    axis1_frame_rod=hgtransform('Parent',handles.world_axes);    
    axis2_frame_cardan=hgtransform('Parent',handles.world_axes);
    axis2_frame_act=hgtransform('Parent',handles.world_axes);
    axis2_frame_rod=hgtransform('Parent',handles.world_axes);    
    axis3_frame_cardan=hgtransform('Parent',handles.world_axes);
    axis3_frame_act=hgtransform('Parent',handles.world_axes);
    axis3_frame_rod=hgtransform('Parent',handles.world_axes);
    tool_frame=hgtransform('Parent',handles.world_axes);
    tool_triad_frame=hgtransform('Parent',handles.world_axes);
    forming_frame=hgtransform('Parent',handles.world_axes);
    
    %Attach model components to transform object
    set(base,'Parent',base_frame);
    set(serial_axis1,'Parent',serial_axis1_frame);
    set(serial_axis2,'Parent',serial_axis2_frame);
    set(serial_axis3,'Parent',serial_axis3_frame);
    set(axis4,'Parent',axis4_frame);
    set(axis5,'Parent',axis5_frame);
    set(axis6,'Parent',axis6_frame);
    set(axis1_cardan,'Parent',axis1_frame_cardan);
    set(axis1_act,'Parent',axis1_frame_act);
    set(axis1_rod,'Parent',axis1_frame_rod);    
    set(axis2_cardan,'Parent',axis2_frame_cardan);
    set(axis2_act,'Parent',axis2_frame_act);
    set(axis2_rod,'Parent',axis2_frame_rod);    
    set(axis3_cardan,'Parent',axis3_frame_cardan);
    set(axis3_act,'Parent',axis3_frame_act);
    set(axis3_rod,'Parent',axis3_frame_rod);
    set(tool_triad,'Parent',tool_triad_frame);
    set(tool,'Parent',tool_frame);
    set(frame,'Parent',forming_frame);
    
    %Model Component Transfomrations
    Tforms=IRB940_PSerial_ForwardK(handles);

    %Assign Transforms to Objects
    set(base_frame,'Matrix',Tforms.base.stl);
    set(serial_axis1_frame,'Matrix',Tforms.serial_axis1.stl);
    set(serial_axis2_frame,'Matrix',Tforms.serial_axis2.stl);
    set(serial_axis3_frame,'Matrix',Tforms.serial_axis3.stl);
    set(axis4_frame,'Matrix',Tforms.axis4.stl);
    set(axis5_frame,'Matrix',Tforms.axis5.stl);
    set(axis6_frame,'Matrix',Tforms.axis6.stl);
    set(axis1_frame_cardan,'Matrix',Tforms.axis1.cardan.stl);
    set(axis1_frame_act,'Matrix',Tforms.axis1.act.stl);
    set(axis1_frame_rod,'Matrix',Tforms.axis1.rod.stl);    
    set(axis2_frame_cardan,'Matrix',Tforms.axis2.cardan.stl);
    set(axis2_frame_act,'Matrix',Tforms.axis2.act.stl);
    set(axis2_frame_rod,'Matrix',Tforms.axis2.rod.stl);    
    set(axis3_frame_cardan,'Matrix',Tforms.axis3.cardan.stl);
    set(axis3_frame_act,'Matrix',Tforms.axis3.act.stl);
    set(axis3_frame_rod,'Matrix',Tforms.axis3.rod.stl);
    set(tool_frame,'Matrix',Tforms.tool.stl);
    set(tool_triad_frame,'Matrix',Tforms.tool_triad.stl);
    set(forming_frame,'Matrix',Tforms.frame.stl);
    
    hold off
end