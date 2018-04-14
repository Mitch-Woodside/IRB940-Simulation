function [c,ceq]=forwardK_confun(x,q1,q2,q3)
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

% Nonlinear inequality constraints
c(1)=sq1-(pi/2);
c(2)=-sq1-(pi/2);
c(3)=sq2-(pi/2);
c(4)=-sq2-(pi/2);
c(5)=-dpb;
% Nonlinear equality constraints
ceq(1)=norm([q1x,q1y,q1z])-q1;
ceq(2)=norm([q2x,q2y,q2z])-q2;
ceq(3)=norm([q3x,q3y,q3z])-q3;
end