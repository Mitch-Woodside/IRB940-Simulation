function handles=tool_orientation_replot(handles)
    Rtoolx=makehgtform('xrotate',(handles.IRB940.InverseK.tool_orient(1)*(pi/180)));
    Rtooly=makehgtform('yrotate',(handles.IRB940.InverseK.tool_orient(2)*(pi/180)));    
    Rtoolz=makehgtform('zrotate',(handles.IRB940.InverseK.tool_orient(3)*(pi/180)));    
    handles.IRB940.InverseK.Rtool=Rtoolx*Rtooly*Rtoolz;
    
    Rtool=handles.IRB940.InverseK.Rtool;
    
    axes(handles.tool_orientation_axes);
    xlabel(gca,'X')
    ylabel(gca,'Y')
    zlabel(gca,'Z')
    
    hg=findobj(gca,'Type','hgtransform');
    set(hg,'Matrix',Rtool);
end