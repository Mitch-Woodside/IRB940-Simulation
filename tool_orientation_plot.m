function tool_orientation_plot(handles)
    Rtoolx=makehgtform('xrotate',(handles.IRB940.InverseK.tool_orient(1)*(pi/180)));
    Rtooly=makehgtform('yrotate',(handles.IRB940.InverseK.tool_orient(2)*(pi/180)));    
    Rtoolz=makehgtform('zrotate',(handles.IRB940.InverseK.tool_orient(3)*(pi/180)));    
    handles.IRB940.InverseK.Rtool=Rtoolx*Rtooly*Rtoolz;
    
    Rtool=handles.IRB940.InverseK.Rtool;
    
    axes(handles.tool_orientation_axes);
    xlabel(gca,'X')
    ylabel(gca,'Y')
    zlabel(gca,'Z')
    
    original(1)=plot3([1,0],[0,0],[0,0],'LineWidth',1,'Color','r');
    hold all
    original(2)=plot3([0,0],[1,0],[0,0],'LineWidth',1,'Color','g');
    original(3)=plot3([0,0],[0,0],[1,0],'LineWidth',1,'Color','b');   
    tool_triad(1)=plot3([.75,0],[0,0],[0,0],'LineWidth',5,'Color','r');
    tool_triad(2)=plot3([0,0],[.75,0],[0,0],'LineWidth',5,'Color','g');
    tool_triad(3)=plot3([0,0],[0,0],[.75,0],'LineWidth',5,'Color','b');
    hold off
    
    origin=hggroup('Parent',handles.tool_orientation_axes);
    tool_frame=hgtransform('Parent',handles.tool_orientation_axes);
    set(original,'Parent',origin);
    set(tool_triad,'Parent',tool_frame);
    set(tool_frame,'Matrix',Rtool);
end