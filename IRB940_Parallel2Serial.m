function handles=IRB940_Parallel2Serial(handles)
    %Nominal and Static Robot Dimensions
    d3=handles.IRB940.DH.d3;
    dpc=handles.IRB940.RD.dpc;
    dia=handles.IRB940.RD.dia;
    
    %Adds Initial Axis Displacement to Joint Values   
    q1=handles.IRB940.axis1.q1+dia;    
    q2=handles.IRB940.axis2.q2+dia;
    q3=handles.IRB940.axis3.q3+dia;

    %Optimization Function
    %Returns serial joint values that meet forward kinematic constraints 
    options = optimoptions('fmincon','Display','none','OptimalityTolerance',1.0000e-10,'ConstraintTOlerance',1.0000e-7,'MaxFunctionEvaluations',8000);
    q=fmincon(@forwardK_function,zeros(12,1),[],[],[],[],[],[],@(x)forwardK_confun(x,q1,q2,q3),options);

    %Converts serial joint values to degrees. (sq1 and sq2)
    %Adds theoretical offset to platform center. (sq3)
    sq1=(q(1)*(180/pi));
    sq2=(q(2)*(180/pi));
    sq3=(q(3)+dpc-d3);%Adds offset to wrist center

    handles.IRB940.serial_axis1.sq1=sq1;    
    handles.IRB940.serial_axis2.sq2=sq2;
    handles.IRB940.serial_axis3.sq3=sq3;
end