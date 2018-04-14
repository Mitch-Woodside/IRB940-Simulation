function error_norm=forwardK_function(x)
sq1=x(1);
sq2=x(2);
dpb=x(3);
q1x=x(4);
q1y=x(5);
q1z=x(6);
q2x=x(7);
q2y=x(8);
q2z=x(9);
q3x=x(10);
q3y=x(11);
q3z=x(12);


%Known Constants
Oc1b=[0,-300,173.205]';
Oc2b=[0,0,-346.41]';
Oc3b=[0,300,173.205]';
Os1p=[0,-87.375,50.446]';
Os2p=[0,0,-100.892]';
Os3p=[0,87.375,50.446]';

%Unkown Matrices
q1=[q1x,q1y,q1z]';
q2=[q2x,q2y,q2z]';
q3=[q3x,q3y,q3z]';

Opb=[cos(sq1)*cos(sq2)*dpb;
     sin(sq2)*dpb;
    -cos(sq2)*sin(sq1)*dpb];

Rpb=[cos(sq1)*cos(sq2), -cos(sq1)*sin(sq2), sin(sq1);
     sin(sq2),           cos(sq2),          0;
    -cos(sq2)*sin(sq1),  sin(sq1)*sin(sq2), cos(sq1)];

Os1b=Rpb*Os1p;
Os2b=Rpb*Os2p;
Os3b=Rpb*Os3p;

%Nonlinear Equations
error(1:3)=Oc1b+q1-Opb-Os1b;
error(4:6)=Oc2b+q2-Opb-Os2b;
error(7:9)=Oc3b+q3-Opb-Os3b;

error_norm=norm(error);
end
