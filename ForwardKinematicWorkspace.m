clear;
syms Ssq1 Csq1 Ssq2 Csq2 dpb Osixp Osiyp Osizp real

Roty=[Csq1  0   Ssq1    0;
      0     1   0       0;
     -Ssq1  0   Csq1    0;
      0     0   0       1];
Rotz=[Csq2 -Ssq2    0   0;
      Ssq2  Csq2    0   0;
      0     0       1   0;
      0     0       0   1];
Transx=[1   0   0   dpb;
        0   1   0   0;
        0   0   1   0;
        0   0   0   1];
    
Tpb=Roty*Rotz*Transx;

Osip=[Osixp, Osiyp, Osizp]';

Rpb=Roty*Rotz;

Rpb=Rpb(1:3,1:3);

Osib=Rpb*Osip;

Opb=Tpb(1:3,4);