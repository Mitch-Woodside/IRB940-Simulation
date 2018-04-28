function Module_Output(path,path_settings)
    %READ PATH TYPE
    %DESCRIPTION: This reads what type of path is being input into the
    %function. Depending on the class type, different command functions will be
    %used.
    path_type=string(class(path));

    %DECOUPLE PATH PARAMETERS
    %DESCRIPTION: This section of code decouples the path parameters from
    %the path_settings struct and seperates it into its different
    %variables. This is done to reduce the size of function input
    %arguments.
    speed=path_settings.speed;
    zone=path_settings.zone;
    wobj=path_settings.wobj;
    tool=path_settings.tool;
    
    %PROMPT USER TO CREATE FILE
    %DESCRIPTION: This section of code uses a MATLAB ui to prompt the user
    %to create a file name (and path) for the .mod file that will be
    %created.
    pathname = uigetdir();
    filename = 'form_path.mod';
    
    if isequal(pathname,0)
        disp('Failed to create file')
    else
        disp(['File ', filename,' stored at: ', fullfile(pathname,filename)])
    end
    
    %Open File
    fileID = fopen(fullfile(pathname,filename),'w');

    %HEADER
    %DESCRIPTION: These string arrays are necessary to create a .mod file
    %in the RAPID programming language. The format of the header MUST be
    %this way. DO NOT alter the header format for any reason. It will
    %generate syntax errors when oppened on the controller.
    Header=strings(6);
    Header(1)="%%%";
    Header(2)="VERSION:1";
    Header(3)="LANGUAGE:ENGLISH";
    Header(4)="%%%";
    for s=1:(length(Header)-2)
        fprintf(fileID,'%-s\n',Header(s));   
    end
    
    %MODULE DECLARATION 
    %DESCRIPTION: These string arrays are necessary to correctly declare a
    %module file in RAPID syntax. The module is named and declared by the
    %Module(1) and Module(4) string arrays. The Module(2) and Module(3) string arrays are
    %used to declare the routine within the module. This routine is named
    %path.
    Module=strings(4);
    modulename=erase(filename,".mod");
    Module(1)=strcat("MODULE ",modulename);
    Module(2)="PROC path()";
    Module(3)="ENDPROC";
    Module(4)="ENDMODULE";
    
    
    %WRITING MODULE STRING ARRAYS TO FILE
    %DESCRIPTION: This section of the code writes the string arrays from
    %Module(1:4) on the .mod file. It also writes the point commands to the
    %robot in the correct syntax.
    fprintf(fileID,"\n%1$-s\n  %2$-s\n",Module(1),Module(2));
    for i = 1:length(path)
        %Based on the path_type, different RAPID motion commands are used.
        if path_type == 'robotarget'
            %Writes MoveAbsJ command to file in the proper RAPID syntax.
            fprintf(fileID,'    %-s\n',MoveL(path(i),speed,zone,tool,wobj)); 
        elseif path_type == 'jointtarget'
            %Writes MoveAbsJ command to file in the proper RAPID syntax.
            fprintf(fileID,'    %-s\n',MoveAbsJ(path(i),speed,zone,tool));
            fprintf(fileID,'    WaitTime 5;\n');
        end
    end  
    fprintf(fileID,"  %1$-s\n%2$-s",Module(3),Module(4));
    
    %File is closed
    fclose(fileID);
end