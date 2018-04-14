function handles=IRB940_ForwardKinematics(handles)
    q1=handles.IRB940.axis1.q1;    
    q2=handles.IRB940.axis2.q2;
    q3=handles.IRB940.axis3.q3;


    %Optimization Function
    options = optimoptions('fmincon','Display','none','OptimalityTolerance',1.0000e-10,'ConstraintTOlerance',1.0000e-7,'MaxFunctionEvaluations',8000);
%     disp(options);
    q=fmincon(@forwardK_function,zeros(12,1),[],[],[],[],[],[],@(x)forwardK_confun(x,q1,q2,q3),options);
    
    sq1=(q(1)*(180/pi));
    sq2=(q(2)*(180/pi));
    sq3=(q(3)+289.2);%Adds offset to wrist center

    handles.IRB940.serial_axis1.sq1=sq1;    
    handles.IRB940.serial_axis2.sq2=sq2;
    handles.IRB940.serial_axis3.sq3=sq3;
    
    IRB940_RePlot(handles);
end