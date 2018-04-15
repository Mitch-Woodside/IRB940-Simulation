%This class is used to emulate the joint target 
%class from the RAPID programming language.
classdef jointtarget
    properties
        name=""
        %ROBOT AXIS JOINTS
        rax_1=0;
        rax_2=0;
        rax_3=0;
        rax_4=0;
        rax_5=0;
        rax_6=0;
        %EXTERNAL AXIS JOINTS
        eax_a="9E+09"
        eax_b="9E+09"
        eax_c="9E+09"
        eax_d="9E+09"
        eax_e="9E+09"
        eax_f="9E+09"
    end
    methods
        function obj = jointtarget(positions)
            if nargin ~= 0
                [m,n]=size(positions);
                obj(m,1) = jointtarget;
                for i=1:m
                    obj(i).rax_1=positions(i,1);
                    obj(i).rax_2=positions(i,2);
                    obj(i).rax_3=positions(i,3);
                    obj(i).rax_4=positions(i,4);
                    obj(i).rax_5=positions(i,5);
                    obj(i).rax_6=positions(i,6);
                end
            end
        end
    end
end