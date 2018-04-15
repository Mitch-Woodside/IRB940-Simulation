function IRB940=IRB940_Structure()
    %DH Parameters
    IRB940.DH.db=650;
    IRB940.DH.d3=1005.556;
    IRB940.DH.d6=155;
    IRB940.DH.dTool=[.65,.46,253.76];
    
    %Static Robot Dimensions
    IRB940.RD.bside=600;
    IRB940.RD.pside=174.75;
    IRB940.RD.dpc=289.2;
    IRB940.RD.dia=757.2616;
    IRB940.RD.frame=makehgtform('translate',[1479.713, -126.240, 1330.488])* ...
                    makehgtform('zrotate',90.2616*(pi/180))* ...
                    makehgtform('xrotate',0.3873*(pi/180))* ...
                    makehgtform('yrotate',-0.0139*(pi/180));

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
    IRB940.serial_axis3.sq3=0;
    
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
    IRB940.axis6.range=[-300,300];
    
    %Load Axis 1
    [IRB940.axis1.act.vertices, IRB940.axis1.act.faces, IRB940.axis1.act.normals]=stlRead("TR600_ACT_AX1.stl");
    [IRB940.axis1.rod.vertices, IRB940.axis1.rod.faces, IRB940.axis1.rod.normals]=stlRead("TR600_ROD_AX1.stl");
    [IRB940.axis1.cardan.vertices, IRB940.axis1.cardan.faces, IRB940.axis1.cardan.normals]=stlRead("TR600_Y_AX1.stl");        
    IRB940.axis1.q1=0;
    IRB940.axis1.range=[0,600];
    
    %Load Axis 2
    [IRB940.axis2.act.vertices, IRB940.axis2.act.faces, IRB940.axis2.act.normals]=stlRead("TR600_ACT_AX2.stl");
    [IRB940.axis2.rod.vertices, IRB940.axis2.rod.faces, IRB940.axis2.rod.normals]=stlRead("TR600_ROD_AX2.stl");
    [IRB940.axis2.cardan.vertices, IRB940.axis2.cardan.faces, IRB940.axis2.cardan.normals]=stlRead("TR600_Y_AX2.stl");        
    IRB940.axis2.q2=0;
    IRB940.axis2.range=[0,600];
    
    %Load Axis 3
    [IRB940.axis3.act.vertices, IRB940.axis3.act.faces, IRB940.axis3.act.normals]=stlRead("TR600_ACT_AX3.stl");
    [IRB940.axis3.rod.vertices, IRB940.axis3.rod.faces, IRB940.axis3.rod.normals]=stlRead("TR600_ROD_AX3.stl");
    [IRB940.axis3.cardan.vertices, IRB940.axis3.cardan.faces, IRB940.axis3.cardan.normals]=stlRead("TR600_Y_AX3.stl");        
    IRB940.axis3.q3=0;
    IRB940.axis3.range=[0,600];
    
    %Load Tool
    [IRB940.tool.vertices, IRB940.tool.faces, IRB940.tool.normals]=stlRead("ISF_Tool_STL.stl");
    
    %Load Frame Assembly
    [IRB940.frame.vertices, IRB940.frame.faces, IRB940.frame.normals]=stlRead("T-Slot ASsembly-45 brackets.stl");
    
    %Inverse Kinematics Data
    IRB940.InverseK.tool_coord=[1160.556,0,650,1]';
    IRB940.InverseK.tool_orient=[0, 0, 0]';
    IRB940.InverseK.Rtool=eye(4);
    IRB940.InverseK.Config=1;
end