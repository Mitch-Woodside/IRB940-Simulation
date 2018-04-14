%Inputs
syms Csq1 Ssq1 Csq2 Ssq2 sq3 Cq4 Sq4 Cq5 Sq5 Cq6 Sq6 r11 r12 r13 r21 r22 r23 r31 r32 r33
syms Oc1y Oc1z Oc2y Oc2z Oc3y Oc3z dpc
% sq1=0;
% sq2=0;
% sq3=1005.556;
% q4=0;
% q5=-;
% q6=0;
% 
% Csq1=cos(sq1*(pi/180));
% Ssq1=sin(sq1*(pi/180));
% Csq2=cos(sq2*(pi/180)+(pi/2));
% Ssq2=sin(sq2*(pi/180)+(pi/2));
% 
% Cq4=cos(q4*(pi/180)+(pi/2));
% Sq4=sin(q4*(pi/180)+(pi/2));
% Cq5=cos(q5*(pi/180));
% Sq5=sin(q5*(pi/180));
% Cq6=cos(q6*(pi/180));
% Sq6=sin(q6*(pi/180));

%Robot Dimensions
% d6=155;
% dpc=289.2;%Platform to Wrist Center Length


%Transformations 
    %Wrist Center Transformation
    Ab=[1  0 0 0;
        0  0 1 0;
        0 -1 0 0;
        0  0 0 1];
    A11=[Csq1 -Ssq1 0 0;
         Ssq1  Csq1 0 0;
         0     0    1 0;
         0     0    0 1];
    A12=[1 0  0  0;
         0 0 -1  0;
         0 1  0  0;
         0 0  0  1];
    A1=A11*A12;
    %sq2=sq2+90
    A21=[Csq2 -Ssq2 0 0;
         Ssq2  Csq2 0 0;
         0     0    1 0;
         0     0    0 1];
    A22=[1  0  0  0;
         0  0 -1  0;
         0  1  0  0;
         0  0  0  1];
    A2=A21*A22;
     
    A3=[1 0 0 0;
        0 1 0 0;
        0 0 1 sq3-dpc;
        0 0 0 1];
    
        T1b=Ab*A1;
        T2b=Ab*A1*A2;
        T3b=Ab*A1*A2*A3;

    %Writst Transformation
    %q4=q4+90
    A41=[Cq4 -Sq4 0 0;
         Sq4  Cq4 0 0;
         0     0  1 0;
         0     0  0 1];
    A42=[1  0  0  0;
         0  0 -1  0;
         0  1  0  0;
         0  0  0  1];
    A4=A41*A42;

    A51=[Cq5 -Sq5 0 0;
         Sq5  Cq5 0 0;
         0     0  1 0;
         0     0  0 1];
    A52=[1  0  0  0;
         0  0  1  0;
         0 -1  0  0;
         0  0  0  1];
    A5=A51*A52;
    
    A61=[Cq6 -Sq6 0 0;
         Sq6  Cq6 0 0;
         0     0  1 0;
         0     0  0 1];
    A62=[1  0  0  0;
         0  1  0  0;
         0  0  1  155;
         0  0  0  1];
    A6=A61*A62;
    
        T4b=Ab*A1*A2*A3*A4;
        T5b=Ab*A1*A2*A3*A4*A5;
        T6b=Ab*A1*A2*A3*A4*A5*A6;

    %Tool Transformation
    Atool1=[1  0  0  0;
            0 -1  0  0;
            0  0 -1  0;
            0  0  0  1];
    Atool2=[0  0  1  0;
            0  1  0  0;
           -1  0  0  0;
            0  0  0  1];
    Atool=Atool1*Atool2;
    Ttoolb=T6b*Atool;
    
    R3b=T3b(1:3,1:3);
    Rtool4=A4*A5*A6*Atool;
    Rtool4=Rtool4(1:3,1:3);
    R=[r11 r12 r13;
       r21 r22 r23;
       r31 r32 r33];
   
   
    disp(transpose(R3b)*R);
%    
%    disp(transpose(R3b)*R)
%         Otool=tform2trvec(Ttoolb);
% 
%     %Platform Transformation
%     Ap3=makehgtform('translate',[0, 0, -dpc]);
% 
%         Tpb=Ab*A1*A2*A3*Ap3;
% 
%     %Spherical Joint Transformation
%     As1=makehgtform('translate',[0,  -((sqrt(3)/2)*parm),  ((1/2)*parm)]);
%     As2=makehgtform('translate',[0,  0,  -parm]);
%     As3=makehgtform('translate',[0,  ((sqrt(3)/2)*parm),  ((1/2)*parm)]);
%     pb_align=makehgtform('xrotate',-(pi/2))*makehgtform('zrotate',-(pi/2));
% 
%         Ts1b=Tpb*pb_align*As1;
%         Ts2b=Tpb*pb_align*As2;
%         Ts3b=Tpb*pb_align*As3;
%         Os1=tform2trvec(Ts1b);
%         Os2=tform2trvec(Ts2b);
%         Os3=tform2trvec(Ts3b);
% 
%     %Cardan Joints Origins   
%     Oc1=[0, -((sqrt(3)/2)*barm), (1/2)*barm];
%     Oc2=[0, 0, -barm];
%     Oc3=[0, ((sqrt(3)/2)*barm), (1/2)*barm];
% 
%     %Axis1-3 Transformations
%     Axis1=Os1-Oc1;
%     Axis2=Os2-Oc2;
%     Axis3=Os3-Oc3;
% 
%         %Cardan Joints Transformations
%         Rc1=makehgtform('zrotate',atan2(Axis1(2),Axis1(1)));
%         Rc2=makehgtform('zrotate',atan2(Axis2(2),Axis2(1)));
%         Rc3=makehgtform('zrotate',atan2(Axis3(2),Axis3(1)));
%         Tc1b=makehgtform('translate',Oc1)*Rc1;
%         Tc2b=makehgtform('translate',Oc2)*Rc2;
%         Tc3b=makehgtform('translate',Oc3)*Rc3;
% 
%         %Axis 1-3 Transformations
%         Ra1=makehgtform('yrotate',atan2(sqrt(Axis1(1)^2+Axis1(2)^2),Axis1(3)));
%         Ra2=makehgtform('yrotate',atan2(sqrt(Axis2(1)^2+Axis2(2)^2),Axis2(3)));
%         Ra3=makehgtform('yrotate',atan2(sqrt(Axis3(1)^2+Axis3(2)^2),Axis3(3)));
%         Ta1b=makehgtform('translate',Oc1)*Rc1*Ra1;
%         Ta2b=makehgtform('translate',Oc2)*Rc2*Ra2;
%         Ta3b=makehgtform('translate',Oc3)*Rc3*Ra3;
% 
%         %Rod Transformations
%         Tr1b=Ta1b*makehgtform('translate',[0,0,norm(Axis1)]);
%         Tr2b=Ta2b*makehgtform('translate',[0,0,norm(Axis2)]);
%         Tr3b=Ta3b*makehgtform('translate',[0,0,norm(Axis3)]);
% 
%         %Current Joint Values
%         q1=(norm(Axis1)-757.2616);
%         q2=(norm(Axis2)-757.2616);
%         q3=(norm(Axis3)-757.2616);
