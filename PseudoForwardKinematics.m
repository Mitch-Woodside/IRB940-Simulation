    %Inputs
%     betap=handles.IRB940.beta_link.beta;    
%     gammap=handles.IRB940.gamma_link.gamma;
%     rc=handles.IRB940.center.rc;
%     q4=handles.IRB940.axis4.q4;
%     q5=handles.IRB940.axis5.q5;
%     q6=handles.IRB940.axis6.q6;
    pitch=0*(pi/180);
    roll=0*(pi/180);
    dcb=1005.556;
    q4=0*(pi/180);
    q5=0*(pi/180);
    q6=0;
    d6=155;%Wrist to Tool

    %Robot Dimensions
    bside=600;%Base Side Length
    pside=174.75;%Platform Side Length
    dpc=289.2;%Platform to Wrist Center Length
    tool_off=[0 0 0];%Tool Offset

    %Robot Base/Platform Dimension Calculations
    barm=((2/3)*sqrt((bside^2-(bside/2)^2)));
    parm=(2/3)*sqrt((pside^2-(pside/2)^2));

    %Transformations 
        %Wrist Center Transformation
        Ab=makehgtform('xrotate',-(pi/2));
        A1=makehgtform('zrotate',pitch)*makehgtform('xrotate',(pi/2));
        A2=makehgtform('zrotate',(roll+(pi/2)))*makehgtform('xrotate',+(pi/2));
        A3=makehgtform('translate',[0, 0, dcb]);
        
            T1b=Ab*A1;
            T2b=Ab*A1*A2;
            T3b=Ab*A1*A2*A3;
            Ocb=tform2trvec(T3b);
        
        %Writst Transformation
        A4=makehgtform('zrotate',(q4+(pi/2)))*makehgtform('xrotate',(pi/2));
        A5=makehgtform('zrotate',q5)*makehgtform('xrotate',-(pi/2));
        A6=makehgtform('zrotate',q6)*makehgtform('translate',[0, 0, d6]);
        
            T4b=Ab*A1*A2*A3*A4;
            T5b=Ab*A1*A2*A3*A4*A5;
            T6b=Ab*A1*A2*A3*A4*A5*A6;

        %Tool Transformation
        Atool=makehgtform('translate',tool_off);
        
            Ttoolb=T6b*Atool;
            Otool=tform2trvec(Ttoolb);
        
        %Platform Transformation
        Ap3=makehgtform('translate',[0, 0, -dpc]);
        
            Tpb=Ab*A1*A2*A3*Ap3;
                
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
        Oc1=[0, -((sqrt(3)/2)*barm), (1/2)*barm];
        Oc2=[0, 0, -barm];
        Oc3=[0, ((sqrt(3)/2)*barm), (1/2)*barm];
        
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
            disp((atan2(Axis1(2),Axis1(1)))*(180/pi));
            disp((atan2(Axis2(2),Axis2(1)))*(180/pi));
            disp((atan2(Axis3(2),Axis3(1)))*(180/pi));

            %Axis 1-3 Transformations
            Ra1=makehgtform('yrotate',atan2(Axis1(1),Axis1(3)));
            Ra2=makehgtform('yrotate',atan2(Axis2(1),Axis2(3)));
            Ra3=makehgtform('yrotate',atan2(Axis3(1),Axis3(3)));
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
        
    %Plot on Figure
    world=axes('XLim',[-d3p d3p],'YLim',[-d3p d3p],'ZLim',[-d3p d3p]);
    %base
    plot3([Oc1(1),Oc2(1),Oc3(1),Oc1(1)],[Oc1(2),Oc2(2),Oc3(2),Oc1(2)],[Oc1(3),Oc2(3),Oc3(3),Oc1(3)]);
    hold on;
    %platform
    plot3([Os1(1),Os2(1),Os3(1),Os1(1)],[Os1(2),Os2(2),Os3(2),Os1(2)],[Os1(3),Os2(3),Os3(3),Os1(3)]);
    %center
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