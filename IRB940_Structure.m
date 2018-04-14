function IRB940=IRB940_Structure()
    %Load Base
    [IRB940.base.vertices, IRB940.base.faces, IRB940.base.normals]=stlRead("TR600_0.stl");
    
    %Load Serial Axis 1
    [IRB940.serial_axis1.vertices,  IRB940.serial_axis1.faces, IRB940.serial_axis1.normals]=stlRead("TR600_CYL_1.stl");
    IRB940.serial_axis1.sq1=0;
    
    %Load Serial Axis 2
    [IRB940.serial_axis2.vertices, IRB940.serial_axis2.faces, IRB940.serial_axis2.normals]=stlRead("TR600_CYL_2.stl");
    IRB940.serial_axis2.sq2=0;
    
    %Load Serial Axis 3
    [IRB940.serial_axis3.vertices, IRB940.serial_axis3.faces, IRB940.serial_axis3.normals]=stlRead("TR600_CYL.stl");
    IRB940.serial_axis3.sq3=1005.556;
    
    %Load Axis 4
    [IRB940.axis4.vertices, IRB940.axis4.faces, IRB940.axis4.normals]=stlRead("TR600_4.stl");
    IRB940.axis4.q4=0;
    IRB940.axis4.range=[-300,300];
    
    %Load Axis 5
    [IRB940.axis5.vertices, IRB940.axis5.faces, IRB940.axis5.normals]=stlRead("TR600_5.stl");
    IRB940.axis5.q5=0;
    IRB940.axis5.range=[-150,115];
    
    %Load Axis 6
    [IRB940.axis6.vertices, IRB940.axis6.faces, IRB940.axis6.normals]=stlRead("TR600_6.stl");
    IRB940.axis6.q6=0;
    IRB940.axis6.d6=155;
    IRB940.axis6.range=[-300,300];
    
    %Load Axis 1
    [IRB940.axis1.act.vertices, IRB940.axis1.act.faces, IRB940.axis1.act.normals]=stlRead("TR600_ACT_AX1.stl");
    [IRB940.axis1.rod.vertices, IRB940.axis1.rod.faces, IRB940.axis1.rod.normals]=stlRead("TR600_ROD_AX1.stl");
    [IRB940.axis1.cardan.vertices, IRB940.axis1.cardan.faces, IRB940.axis1.cardan.normals]=stlRead("TR600_Y_AX1.stl");        
    IRB940.axis1.q1=757.2616;
    IRB940.axis1.range=[0,600];
    
    %Load Axis 2
    [IRB940.axis2.act.vertices, IRB940.axis2.act.faces, IRB940.axis2.act.normals]=stlRead("TR600_ACT_AX2.stl");
    [IRB940.axis2.rod.vertices, IRB940.axis2.rod.faces, IRB940.axis2.rod.normals]=stlRead("TR600_ROD_AX2.stl");
    [IRB940.axis2.cardan.vertices, IRB940.axis2.cardan.faces, IRB940.axis2.cardan.normals]=stlRead("TR600_Y_AX2.stl");        
    IRB940.axis2.q2=757.2616;
    IRB940.axis2.range=[0,600];
    
    %Load Axis 3
    [IRB940.axis3.act.vertices, IRB940.axis3.act.faces, IRB940.axis3.act.normals]=stlRead("TR600_ACT_AX3.stl");
    [IRB940.axis3.rod.vertices, IRB940.axis3.rod.faces, IRB940.axis3.rod.normals]=stlRead("TR600_ROD_AX3.stl");
    [IRB940.axis3.cardan.vertices, IRB940.axis3.cardan.faces, IRB940.axis3.cardan.normals]=stlRead("TR600_Y_AX3.stl");        
    IRB940.axis3.q3=757.2616;
    IRB940.axis3.range=[0,600];
    
    %Inverse Kinematics Data
    IRB940.InverseK.tool_coord=[1160.556,0,0,1]';
    IRB940.InverseK.tool_orient=[0, 0, 0]';
    IRB940.InverseK.Rtool=eye(4);
    IRB940.InverseK.Config=1;
end