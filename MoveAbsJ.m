function output_string=MoveAbsJ(jointtarget,speed,zone,tool)
            if isstring(jointtarget)
                jointtarget_data=jointtarget;
            else
                %Convert jointtarget numeric to string
                rax_1str=num2str(jointtarget.rax_1);
                rax_2str=num2str(jointtarget.rax_2);
                rax_3str=num2str(jointtarget.rax_3);
                rax_4str=num2str(jointtarget.rax_4);
                rax_5str=num2str(jointtarget.rax_5);
                rax_6str=num2str(jointtarget.rax_6);
                eax_astr=jointtarget.eax_a;
                eax_bstr=jointtarget.eax_b;
                eax_cstr=jointtarget.eax_c;
                eax_dstr=jointtarget.eax_d;
                eax_estr=jointtarget.eax_e;
                eax_fstr=jointtarget.eax_f;  

                %Coordinates
                joints_axis=sprintf('[[%1$s,%2$s,%3$s,%4$s,%5$s,%6$s],',rax_1str,rax_2str,rax_3str,rax_4str,rax_5str,rax_6str);
                %External Axis
                external_axis=sprintf('[%1$s,%2$s,%3$s,%4$s,%5$s,%6$s]]',eax_astr,eax_astr,eax_bstr,eax_cstr,eax_dstr,eax_estr,eax_fstr);

                jointtarget_data=strcat(joints_axis,external_axis);
                %fprintf(output_string);
            end
                
            
            %Convert Jointtarget numeric values to string values
            speed=num2str(speed);

            %Speed
            speed_data=sprintf(',[%1$s,500,5000,1000]',speed);
            %Motion Control
            motion_control=sprintf('%1$s,%2$s,%3$s;',speed_data,zone,tool);

            output_string=strcat("MoveAbsJ ",jointtarget_data,motion_control);
            %fprintf(output_string);
end