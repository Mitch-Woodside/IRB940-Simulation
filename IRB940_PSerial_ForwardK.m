function transformations=IRB940_PSerial_ForwardK(handles)
    %Inputs
    sq1=handles.IRB940.serial_axis1.sq1;    
    sq2=handles.IRB940.serial_axis2.sq2;
    sq3=handles.IRB940.serial_axis3.sq3;
    q4=handles.IRB940.axis4.q4;
    q5=handles.IRB940.axis5.q5;
    q6=handles.IRB940.axis6.q6;

    %Nominal DH Parameters
    db=handles.IRB940.DH.db;
    d3=handles.IRB940.DH.d3;
    d6=handles.IRB940.DH.d6;
    tool_off=handles.IRB940.DH.dTool;
    
    %Robot Base/Platform Dimension Calculations
    bside=handles.IRB940.RD.bside;
    pside=handles.IRB940.RD.pside;
    dpc=handles.IRB940.RD.dpc;
    barm=((2/3)*sqrt((bside^2-(bside/2)^2)));
    parm=(2/3)*sqrt((pside^2-(pside/2)^2));

    %Transformations 
        %Wrist Center Transformation
        Ab=makehgtform('translate',[0,0,db])*makehgtform('xrotate',(-pi/2));
        A1=makehgtform('zrotate',(sq1*pi/180))*makehgtform('xrotate',(pi/2));
        A2=makehgtform('zrotate',((sq2*pi/180)+(pi/2)))*makehgtform('xrotate',+(pi/2));
        A3=makehgtform('translate',[0, 0, sq3+d3]);
        
            T1b=Ab*A1;
            T2b=Ab*A1*A2;
            T3b=Ab*A1*A2*A3;
            Ocb=T3b(1:3,4);
        
        %Wrist Transformation
        A4=makehgtform('zrotate',((q4*pi/180)-(pi/2)))*makehgtform('xrotate',(-pi/2));
        A5=makehgtform('zrotate',(q5*pi/180))*makehgtform('xrotate',+(pi/2));
        A6=makehgtform('zrotate',(q6*(pi/180)))*makehgtform('translate',[0, 0, d6]);
            
            T4b=Ab*A1*A2*A3*A4;
            T5b=Ab*A1*A2*A3*A4*A5;
            T6b=Ab*A1*A2*A3*A4*A5*A6;

        %Tool Transformation
        Atool=makehgtform('translate',tool_off);
        
            Ttoolb=T6b*Atool;
            Otool=Ttoolb(1:3,4);
%           disp(A4*A5*A6*Atool);
        
        %Platform Transformation
        Acp=makehgtform('translate',[0, 0, -dpc]);
        
            Tpb=Ab*A1*A2*A3*Acp;
                
        %Spherical Joint Transformation
        As1=makehgtform('translate',[0,  -((sqrt(3)/2)*parm),  ((1/2)*parm)]);
        As2=makehgtform('translate',[0,  0,  -parm]);
        As3=makehgtform('translate',[0,  ((sqrt(3)/2)*parm),  ((1/2)*parm)]);
        pb_align=makehgtform('xrotate',-(pi/2))*makehgtform('zrotate',-(pi/2));
        
            Ts1b=Tpb*pb_align*As1;
            Ts2b=Tpb*pb_align*As2;
            Ts3b=Tpb*pb_align*As3;
            Os1=tform2trvec(Ts1b);
            Os2=tform2trvec(Ts2b);
            Os3=tform2trvec(Ts3b);

        %Cardan Joints Origins   
        Oc1=[0, -((sqrt(3)/2)*barm), ((1/2)*barm)+db];
        Oc2=[0, 0, (-barm)+db];
        Oc3=[0, ((sqrt(3)/2)*barm), ((1/2)*barm)+db];
        
        %Axis1-3 Transformations
        Axis1=Os1-Oc1;
        Axis2=Os2-Oc2;
        Axis3=Os3-Oc3;

            %Cardan Joints Transformations
            Rc1=makehgtform('zrotate',atan2(Axis1(2),Axis1(1)));
            Rc2=makehgtform('zrotate',atan2(Axis2(2),Axis2(1)));
            Rc3=makehgtform('zrotate',atan2(Axis3(2),Axis3(1)));
            Tc1b=makehgtform('translate',Oc1)*Rc1;
            Tc2b=makehgtform('translate',Oc2)*Rc2;
            Tc3b=makehgtform('translate',Oc3)*Rc3;

            %Axis 1-3 Transformations
            Ra1=makehgtform('yrotate',atan2(sqrt(Axis1(1)^2+Axis1(2)^2),Axis1(3)));
            Ra2=makehgtform('yrotate',atan2(sqrt(Axis2(1)^2+Axis2(2)^2),Axis2(3)));
            Ra3=makehgtform('yrotate',atan2(sqrt(Axis3(1)^2+Axis3(2)^2),Axis3(3)));
            Ta1b=makehgtform('translate',Oc1)*Rc1*Ra1;
            Ta2b=makehgtform('translate',Oc2)*Rc2*Ra2;
            Ta3b=makehgtform('translate',Oc3)*Rc3*Ra3;
            
            %Rod Transformations
            Tr1b=Ta1b*makehgtform('translate',[0,0,norm(Axis1)]);
            Tr2b=Ta2b*makehgtform('translate',[0,0,norm(Axis2)]);
            Tr3b=Ta3b*makehgtform('translate',[0,0,norm(Axis3)]);

            %Current Joint Values
            q1=(norm(Axis1)-757.2616);
            q2=(norm(Axis2)-757.2616);
            q3=(norm(Axis3)-757.2616);
            
        %STL Axis Correction Matrices(Not Part of Kinematic Structure)
        %Model Corrections (Align STL file axes to DH model axes)
        scale=makehgtform('scale',1000);
        %Base
        base_correct=makehgtform('translate',[0,0,db])*makehgtform('yrotate',pi/2)*scale;
        %Serial Axis 1
        serial_axis1_correct=makehgtform('yrotate',(pi/2))*makehgtform('scale',1000);
        %Serial Axis 2
        serial_axis2_correct=makehgtform('zrotate',(-pi/2))*makehgtform('scale',1000);
        %Serial Axis 3
        serial_axis3_correct=makehgtform('zrotate',(-pi/2))*makehgtform('scale',1000);
        %Axis4
        axis4_correct=makehgtform('xrotate',(pi/2))*makehgtform('scale',1000);
        %Axis5
        axis5_correct=scale;
        %Axis6
        axis6_correct=makehgtform('translate',[0, 0, -155])*makehgtform('scale',1000);
        %Tool
        tool_correct=makehgtform('zrotate',pi/2)*makehgtform('translate',[-0.65,-0.46,-267.76]);
        correct=makehgtform('yrotate',(pi/2))*scale;
        
        %Assign DH Transformations
        transformations.serial_axis1.DH=T1b;
        transformations.serial_axis2.DH=T2b;
        transformations.serial_axis3.DH=T3b;
        transformations.axis4.DH=T4b;
        transformations.axis5.DH=T5b;
        transformations.axis6.DH=T6b;
        transformations.axis1.cardan.DH=Tc1b;
        transformations.axis2.cardan.DH=Tc2b;
        transformations.axis3.cardan.DH=Tc3b;
        transformations.axis1.act.DH=Ta1b;
        transformations.axis2.act.DH=Ta2b;
        transformations.axis3.act.DH=Ta3b;
        transformations.axis1.rod.DH=Tr1b;
        transformations.axis2.rod.DH=Tr2b;
        transformations.axis3.rod.DH=Tr3b;
        transformations.tool.DH=Ttoolb;       
        
        %Corrected STL Transformations (Not Representative of Kinematics)
        transformations.base.stl=base_correct;
        transformations.serial_axis1.stl=T1b*serial_axis1_correct;
        transformations.serial_axis2.stl=T2b*serial_axis2_correct;
        transformations.serial_axis3.stl=T3b*serial_axis3_correct;
        transformations.axis4.stl=T4b*axis4_correct;
        transformations.axis5.stl=T5b*axis5_correct;
        transformations.axis6.stl=T6b*axis6_correct;
        transformations.axis1.cardan.stl=Tc1b*correct;
        transformations.axis2.cardan.stl=Tc2b*correct;
        transformations.axis3.cardan.stl=Tc3b*correct;
        transformations.axis1.act.stl=Ta1b*scale;
        transformations.axis2.act.stl=Ta2b*scale;
        transformations.axis3.act.stl=Ta3b*scale;
        transformations.axis1.rod.stl=Tr1b*scale;
        transformations.axis2.rod.stl=Tr2b*scale;
        transformations.axis3.rod.stl=Tr3b*scale;
        transformations.tool.stl=Ttoolb*tool_correct;
        transformations.tool_triad.stl=Ttoolb*scale;

    %Update Manipulator Outputs
    handles.Axis1_disp.String=num2str(q1);
    handles.Axis2_disp.String=num2str(q2);
    handles.Axis3_disp.String=num2str(q3);
    handles.sq1_disp.String=num2str(sq1);
    handles.sq2_disp.String=num2str(sq2);
    handles.sq3_disp.String=num2str(sq3);
    handles.Axis4_disp.String=num2str(q4);
    handles.Axis5_disp.String=num2str(q5);
    handles.Axis6_disp.String=num2str(q6);
    handles.Toolx_disp.String=num2str(Otool(1));
    handles.Tooly_disp.String=num2str(Otool(2));
    handles.Toolz_disp.String=num2str(Otool(3));


    %Plot on Figure
    axes(handles.kstructure_axes);
    cla
    %base
    plot3([Oc1(1),Oc2(1),Oc3(1),Oc1(1)],[Oc1(2),Oc2(2),Oc3(2),Oc1(2)],[Oc1(3),Oc2(3),Oc3(3),Oc1(3)]);
    hold on;
    %platform
    plot3([Os1(1),Os2(1),Os3(1),Os1(1)],[Os1(2),Os2(2),Os3(2),Os1(2)],[Os1(3),Os2(3),Os3(3),Os1(3)]);
    %Serial Axis 3
    plot3([0,Ocb(1)],[0,Ocb(2)],[0,Ocb(3)]);
    %Axis1
    plot3([Os1(1),Oc1(1)],[Os1(2),Oc1(2)],[Os1(3),Oc1(3)]);
    %Axis2
    plot3([Os2(1),Oc2(1)],[Os2(2),Oc2(2)],[Os2(3),Oc2(3)]);
    %Axis3
    plot3([Os3(1),Oc3(1)],[Os3(2),Oc3(2)],[Os3(3),Oc3(3)]);
    %Axis4
    plot3([Otool(1),Ocb(1)],[Otool(2),Ocb(2)],[Otool(3),Ocb(3)]);
    daspect([1 1 1]);
    hold off;
end