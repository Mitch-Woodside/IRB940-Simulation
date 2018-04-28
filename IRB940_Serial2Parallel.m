function q=IRB940_Serial2Parallel(sq1,sq2,sq3)
    %Fixed Robot Dimensions
    d3=1005.556;
    db=650;%Distance from base frame to center of pseudo axis
    dpc=289.2;%Platform to Wrist Center Length
    dia=757.2616;%Initial Axis Displacement
    bside=600;%Base Side Length
    pside=174.75;%Platform Side Length
    
    %Robot Base/Platform Dimension Calculations
    barm=((2/3)*sqrt((bside^2-(bside/2)^2)));
    parm=(2/3)*sqrt((pside^2-(pside/2)^2));

    for i=1:length(sq1)
            %Parallel Axis Reverse Calculations
            %Platform Transformation
            Ab=makehgtform('translate',[0,0,db])*makehgtform('xrotate',(-pi/2));
            A1=makehgtform('zrotate',(sq1(i)*pi/180))*makehgtform('xrotate',(pi/2));
            A2=makehgtform('zrotate',((sq2(i)*pi/180)+(pi/2)))*makehgtform('xrotate',+(pi/2));
            A3=makehgtform('translate',[0, 0, sq3(i)+d3]);
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

            %Cardan Joints Transformation
            Ac1=makehgtform('translate',[0, -((sqrt(3)/2)*barm), (1/2)*barm]);
            Ac2=makehgtform('translate',[0, 0, -barm]);
            Ac3=makehgtform('translate',[0, ((sqrt(3)/2)*barm), (1/2)*barm]);
            b_align=makehgtform('xrotate',(pi/2));

                Tc1b=Ab*b_align*Ac1;
                Tc2b=Ab*b_align*Ac2;
                Tc3b=Ab*b_align*Ac3;
                Oc1=tform2trvec(Tc1b);
                Oc2=tform2trvec(Tc2b);
                Oc3=tform2trvec(Tc3b);

            %Axis1-3 Vector
            Axis1=Os1-Oc1;
            Axis2=Os2-Oc2;
            Axis3=Os3-Oc3;

            %Return Current Joint Values
            %   Subtracts initial Axis 1-3 displacement (dia)
            %   Rounds Axis 1-3 to 3 decimal places (microns)
            q(i,1)=(norm(Axis1)-dia);
            q(i,2)=(norm(Axis2)-dia);
            q(i,3)=(norm(Axis3)-dia);
    end    
%         %Display to Command Window
%         fprintf("q1: %.3f \n",q(1));
%         fprintf("q2: %.3f \n",q(2));
%         fprintf("q3: %.3f \n",q(3));
end