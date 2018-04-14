function handles=IRB940_InverseKinematics(handles)
    %Nominal DH Parameters
    db=handles.IRB940.DH.db;
    d3=handles.IRB940.DH.d3;
    d6=handles.IRB940.DH.d6;
    
    %Inverse Kinematic Inputs (Position, Tool Orientation, and Config)
    otool=handles.IRB940.InverseK.tool_coord(1:3);
    Rtool=handles.IRB940.InverseK.Rtool;
    cfg=handles.IRB940.InverseK.Config;
    
    %Wrist Center only affected by X Rotational Component.
    Rtoolc=Rtool(1:3,1);

    %Inverse Calculation for Wrist Center----------------------------------
        oc=otool-(d6*Rtoolc);
        ocb=oc-[0,0,db]';

        sq1=atan2(-ocb(3),ocb(1));
        sq2=atan2(ocb(2),(sqrt((ocb(1)^2)+(ocb(3)^2))));
        sq3=sign(ocb(1))*norm(ocb)-d3;
    
    %Inverse Calculation for Axis 4-6--------------------------------------
        %Axis 5 
        cq5=cos(sq1)*sin(sq2+(pi/2))*Rtool(1,1)-cos(sq2+(pi/2))*Rtool(2,1)-sin(sq1)*sin(sq2+(pi/2))*Rtool(3,1);
        q5=atan2(cfg*sqrt(1-(cq5^2)),cq5);

        %Axis 4
        Sq4Sq5=+cos(sq1)*Rtool(3,1)+sin(sq1)*Rtool(1,1);
        Cq4Sq5=+sin(sq2+(pi/2))*Rtool(2,1)+cos(sq1)*cos(sq2+(pi/2))*Rtool(1,1)-cos(sq2+(pi/2))*sin(sq1)*Rtool(3,1);
        if sin(q5)>0
            q4=(atan2(Sq4Sq5,Cq4Sq5)+(pi/2));
        else
            q4=(atan2(-Sq4Sq5,-Cq4Sq5)+(pi/2));
        end

        %Axis 6
        Sq5Sq6=cos(sq1)*sin(sq2+(pi/2))*Rtool(1,2)-cos(sq2+(pi/2))*Rtool(2,2)-sin(sq1)*sin(sq2+(pi/2))*Rtool(3,2);
        Cq6Sq5=cos(sq1)*sin(sq2+(pi/2))*Rtool(1,3)-cos(sq2+(pi/2))*Rtool(2,3)-sin(sq1)*sin(sq2+(pi/2))*Rtool(3,3);
        if sin(q5)<0
            q6=atan2(Sq5Sq6,-Cq6Sq5);
        else
            q6=atan2(-Sq5Sq6,Cq6Sq5);
        end
    
    %Assign Inverse Joint Values to Robot Serial Structure
    handles.IRB940.serial_axis1.sq1=sq1*(180/pi);
    handles.IRB940.serial_axis2.sq2=sq2*(180/pi);
    handles.IRB940.serial_axis3.sq3=sq3;
    handles.IRB940.axis4.q4=q4*(180/pi);
    handles.IRB940.axis5.q5=q5*(180/pi);
    handles.IRB940.axis6.q6=(-q6*(180/pi));


    IRB940_RePlot(handles);
end