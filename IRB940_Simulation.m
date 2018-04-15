function varargout = IRB940_Simulation(varargin)
% IRB940_SIMULATION MATLAB code for IRB940_Simulation.fig
%      IRB940_SIMULATION, by itself, creates a new IRB940_SIMULATION or raises the existing
%      singleton*.
%
%      H = IRB940_SIMULATION returns the handle to a new IRB940_SIMULATION or the handle to
%      the existing singleton*.
%
%      IRB940_SIMULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IRB940_SIMULATION.M with the given input arguments.
%
%      IRB940_SIMULATION('Property','Value',...) creates a new IRB940_SIMULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IRB940_Simulation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IRB940_Simulation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IRB940_Simulation

% Last Modified by GUIDE v2.5 15-Apr-2018 01:18:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IRB940_Simulation_OpeningFcn, ...
                   'gui_OutputFcn',  @IRB940_Simulation_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before IRB940_Simulation is made visible.
function IRB940_Simulation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IRB940_Simulation (see VARARGIN)

%Load IRB940 Structure
handles.IRB940=IRB940_Structure();
%Output to Axes
IRB940_Plot(handles);
   
% Choose default command line output for IRB940_Simulation
handles.output = hObject;

%Tool Orientation Axes Initialization
tool_orientation_plot(handles);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IRB940_Simulation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IRB940_Simulation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in forwardk_toggle.
function forwardk_toggle_Callback(hObject, eventdata, handles)
% hObject    handle to forwardk_toggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of forwardk_toggle

%Show Forward Kinematics Panel
set(handles.forwardk_uipanel,'Visible','on');
%Hide Inverse Kinematics Panel
set(handles.inversek_uipanel,'Visible','off');

% --- Executes on button press in inversek_toggle.
function inversek_toggle_Callback(hObject, eventdata, handles)
% hObject    handle to inversek_toggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of inversek_toggle
% handles.inversek_uipanel.Visible

%Show Inverse Kinematics Panel
set(handles.inversek_uipanel,'Visible','on');
%Hide Forward Kinematics Panel
set(handles.forwardk_uipanel,'Visible','off');

% --- Executes on button press in Sim_options.
function Sim_options_Callback(hObject, eventdata, handles)
% hObject    handle to Sim_options (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Sim_options

%Show Simulation Options
set(handles.simoptions_uipanel,'Visible','on');
%Hide Inverse Kinematics Panel
set(handles.inversek_uipanel,'Visible','off');
%Hide Forward Kinematics Panel
set(handles.forwardk_uipanel,'Visible','off');

% --- Executes on button press in output.
function output_Callback(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Plot to Axes
IRB940_RePlot(handles);




function Xcoord_value_Callback(hObject, eventdata, handles)
% hObject    handle to Xcoord_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Xcoord_value as text
%        str2double(get(hObject,'String')) returns contents of Xcoord_value as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
% elseif (input<handles.IRB940.axis4.range(1))||(input>handles.IRB940.axis4.range(2))
%   errordlg('You must enter a axis value within the range','Invalid Input','modal')
%   uicontrol(hObject)
%   return    
else
  set(hObject,'Value',input);
  handles.IRB940.InverseK.tool_coord(1)=input;
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function Xcoord_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Xcoord_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ycoord_value_Callback(hObject, eventdata, handles)
% hObject    handle to Ycoord_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ycoord_value as text
%        str2double(get(hObject,'String')) returns contents of Ycoord_value as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
% elseif (input<handles.IRB940.axis4.range(1))||(input>handles.IRB940.axis4.range(2))
%   errordlg('You must enter a axis value within the range','Invalid Input','modal')
%   uicontrol(hObject)
%   return    
else
  set(hObject,'Value',input);
  handles.IRB940.InverseK.tool_coord(2)=input;
  guidata(hObject,handles);
%   display(input); 
end

% --- Executes during object creation, after setting all properties.
function Ycoord_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ycoord_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Zcoord_value_Callback(hObject, eventdata, handles)
% hObject    handle to Zcoord_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Zcoord_value as text
%        str2double(get(hObject,'String')) returns contents of Zcoord_value as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
% elseif (input<handles.IRB940.axis4.range(1))||(input>handles.IRB940.axis4.range(2))
%   errordlg('You must enter a axis value within the range','Invalid Input','modal')
%   uicontrol(hObject)
%   return    
else
  set(hObject,'Value',input);
  handles.IRB940.InverseK.tool_coord(3)=input;
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function Zcoord_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Zcoord_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function XTrot_value_Callback(hObject, eventdata, handles)
% hObject    handle to XTrot_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of XTrot_value as text
%        str2double(get(hObject,'String')) returns contents of XTrot_value as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
% elseif (input<handles.IRB940.axis4.range(1))||(input>handles.IRB940.axis4.range(2))
%   errordlg('You must enter a axis value within the range','Invalid Input','modal')
%   uicontrol(hObject)
%   return    
else
  set(hObject,'Value',input);
  handles.IRB940.InverseK.tool_orient(1)=input;
  handles=tool_orientation_replot(handles);
  guidata(hObject,handles);
%   display(input);
end



% --- Executes during object creation, after setting all properties.
function XTrot_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XTrot_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function YTrot_value_Callback(hObject, eventdata, handles)
% hObject    handle to YTrot_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of YTrot_value as text
%        str2double(get(hObject,'String')) returns contents of YTrot_value as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
% elseif (input<handles.IRB940.axis4.range(1))||(input>handles.IRB940.axis4.range(2))
%   errordlg('You must enter a axis value within the range','Invalid Input','modal')
%   uicontrol(hObject)
%   return    
else
  set(hObject,'Value',input);
  handles.IRB940.InverseK.tool_orient(2)=input;
  handles=tool_orientation_replot(handles);
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function YTrot_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YTrot_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ZTrot_value_Callback(hObject, eventdata, handles)
% hObject    handle to ZTrot_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ZTrot_value as text
%        str2double(get(hObject,'String')) returns contents of ZTrot_value as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
% elseif (input<handles.IRB940.axis4.range(1))||(input>handles.IRB940.axis4.range(2))
%   errordlg('You must enter a axis value within the range','Invalid Input','modal')
%   uicontrol(hObject)
%   return    
else
  set(hObject,'Value',input);
  handles.IRB940.InverseK.tool_orient(3)=input;
  handles=tool_orientation_replot(handles);
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function ZTrot_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ZTrot_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sq2_disp_Callback(hObject, eventdata, handles)
% hObject    handle to sq2_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sq2_disp as text
%        str2double(get(hObject,'String')) returns contents of sq2_disp as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
else
  set(hObject,'Value',input);
  handles.IRB940.serial_axis2.sq2=input;
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function sq2_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sq2_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sq1_disp_Callback(hObject, eventdata, handles)
% hObject    handle to sq1_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sq1_disp as text
%        str2double(get(hObject,'String')) returns contents of sq1_disp as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
else
  set(hObject,'Value',input);
  handles.IRB940.serial_axis1.sq1=input;
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function sq1_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sq1_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sq3_disp_Callback(hObject, eventdata, handles)
% hObject    handle to sq3_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sq3_disp as text
%        str2double(get(hObject,'String')) returns contents of sq3_disp as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
else
  set(hObject,'Value',input);
  handles.IRB940.serial_axis3.sq3=input;
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function sq3_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sq3_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Axis1_value_Callback(hObject, eventdata, handles)
% hObject    handle to Axis1_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Axis1_value as text
%        str2double(get(hObject,'String')) returns contents of Axis1_value as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
elseif (input<handles.IRB940.axis1.range(1))||(input>handles.IRB940.axis1.range(2))
  errordlg('You must enter a axis value within the range','Invalid Input','modal')
  uicontrol(hObject)
  return    
else
  set(hObject,'Value',input);
  handles.IRB940.axis1.q1=(input);%Normalize to robot joint values
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function Axis1_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Axis1_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Axis2_value_Callback(hObject, eventdata, handles)
% hObject    handle to Axis2_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Axis2_value as text
%        str2double(get(hObject,'String')) returns contents of Axis2_value as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
elseif (input<handles.IRB940.axis2.range(1))||(input>handles.IRB940.axis2.range(2))
  errordlg('You must enter a axis value within the range','Invalid Input','modal')
  uicontrol(hObject)
  return    
else
  set(hObject,'Value',input);
  handles.IRB940.axis2.q2=(input);%Normalize to robot joint values
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function Axis2_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Axis2_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Axis3_value_Callback(hObject, eventdata, handles)
% hObject    handle to Axis3_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Axis3_value as text
%        str2double(get(hObject,'String')) returns contents of Axis3_value as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
elseif (input<handles.IRB940.axis3.range(1))||(input>handles.IRB940.axis3.range(2))
  errordlg('You must enter a axis value within the range','Invalid Input','modal')
  uicontrol(hObject)
  return    
else
  set(hObject,'Value',input);
  handles.IRB940.axis3.q3=(input);%Normalize to robot joint values
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function Axis3_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Axis3_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Axis4_value_Callback(hObject, eventdata, handles)
% hObject    handle to Axis4_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Axis4_value as text
%        str2double(get(hObject,'String')) returns contents of Axis4_value as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
elseif (input<handles.IRB940.axis4.range(1))||(input>handles.IRB940.axis4.range(2))
  errordlg('You must enter a axis value within the range','Invalid Input','modal')
  uicontrol(hObject)
  return    
else
  set(hObject,'Value',input);
  handles.IRB940.axis4.q4=input;
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function Axis4_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Axis4_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Axis5_value_Callback(hObject, eventdata, handles)
% hObject    handle to Axis5_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Axis5_value as text
%        str2double(get(hObject,'String')) returns contents of Axis5_value as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
elseif (input<handles.IRB940.axis5.range(1))||(input>handles.IRB940.axis5.range(2))
  errordlg('You must enter a axis value within the range','Invalid Input','modal')
  uicontrol(hObject)
  return    
else
  set(hObject,'Value',input);
  handles.IRB940.axis5.q5=input;
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function Axis5_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Axis5_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Axis6_value.
function Axis6_value_Callback(hObject, eventdata, handles)
% hObject    handle to Axis6_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
elseif (input<handles.IRB940.axis6.range(1))||(input>handles.IRB940.axis6.range(2))
  errordlg('You must enter a axis value within the range','Invalid Input','modal')
  uicontrol(hObject)
  return    
else
  set(hObject,'Value',input);
  handles.IRB940.axis6.q6=input;
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function Axis6_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Axis6_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in inverseK_output.
function inverseK_output_Callback(hObject, eventdata, handles)
% hObject    handle to inverseK_output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles=IRB940_InverseKinematics(handles);
guidata(hObject,handles);


% --- Executes on button press in togglebutton4.
function togglebutton4_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton4


% --- Executes on button press in togglebutton5.
function togglebutton5_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton5


% --- Executes on button press in Zjog.
function Zjog_Callback(hObject, eventdata, handles)
% hObject    handle to Zjog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.InverseK.tool_coord(3)+handles.increment.Value;
handles.IRB940.InverseK.tool_coord(3)=jog;
handles.Zcoord_value.String=num2str(handles.IRB940.InverseK.tool_coord(3));
handles=IRB940_InverseKinematics(handles);
guidata(hObject,handles);

% --- Executes on button press in Xjog.
function Xjog_Callback(hObject, eventdata, handles)
% hObject    handle to Xjog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.InverseK.tool_coord(1)+handles.increment.Value;
handles.IRB940.InverseK.tool_coord(1)=jog;
handles.Xcoord_value.String=num2str(handles.IRB940.InverseK.tool_coord(1));
handles=IRB940_InverseKinematics(handles);
guidata(hObject,handles);

% --- Executes on button press in Yjog.
function Yjog_Callback(hObject, eventdata, handles)
% hObject    handle to Yjog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.InverseK.tool_coord(2)+handles.increment.Value;
handles.IRB940.InverseK.tool_coord(2)=jog;
handles.Ycoord_value.String=num2str(handles.IRB940.InverseK.tool_coord(2));
handles=IRB940_InverseKinematics(handles);
guidata(hObject,handles);


function increment_Callback(hObject, eventdata, handles)
% hObject    handle to increment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of increment as text
%        str2double(get(hObject,'String')) returns contents of increment as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
elseif (input<handles.IRB940.axis5.range(1))||(input>handles.IRB940.axis5.range(2))
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return    
else
  set(hObject,'Value',input);
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function increment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to increment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
input = str2double(get(hObject,'String'));
set(hObject,'Value',input);
guidata(hObject,handles);
%   display(input);

% --- Executes on button press in cfg1_pushbutton.
function cfg1_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to cfg1_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.IRB940.InverseK.Config=-1;
guidata(hObject,handles);
IRB940_InverseKinematics(handles);

% --- Executes on button press in cfg2_pushbutton.
function cfg2_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to cfg2_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.IRB940.InverseK.Config=1;
guidata(hObject,handles);
IRB940_InverseKinematics(handles);


function Yincrement_Callback(hObject, eventdata, handles)
% hObject    handle to Yincrement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Yincrement as text
%        str2double(get(hObject,'String')) returns contents of Yincrement as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
elseif (input<handles.IRB940.axis5.range(1))||(input>handles.IRB940.axis5.range(2))
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return    
else
  set(hObject,'Value',input);
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function Yincrement_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Yincrement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Zincrement_Callback(hObject, eventdata, handles)
% hObject    handle to Zincrement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Zincrement as text
%        str2double(get(hObject,'String')) returns contents of Zincrement as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return
elseif (input<handles.IRB940.axis5.range(1))||(input>handles.IRB940.axis5.range(2))
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return    
else
  set(hObject,'Value',input);
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function Zincrement_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Zincrement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
input = str2double(get(hObject,'String'));
set(hObject,'Value',input);
guidata(hObject,handles);
%   display(input);

% --- Executes on button press in negZjog.
function negZjog_Callback(hObject, eventdata, handles)
% hObject    handle to negZjog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.InverseK.tool_coord(3)-handles.increment.Value;
handles.IRB940.InverseK.tool_coord(3)=jog;
handles.Zcoord_value.String=num2str(handles.IRB940.InverseK.tool_coord(3));
handles=IRB940_InverseKinematics(handles);
guidata(hObject,handles);

% --- Executes on button press in negXjog.
function negXjog_Callback(hObject, eventdata, handles)
% hObject    handle to negXjog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.InverseK.tool_coord(1)-handles.increment.Value;
handles.IRB940.InverseK.tool_coord(1)=jog;
handles.Xcoord_value.String=num2str(handles.IRB940.InverseK.tool_coord(1));
handles=IRB940_InverseKinematics(handles);
guidata(hObject,handles);

% --- Executes on button press in negYjog.
function negYjog_Callback(hObject, eventdata, handles)
% hObject    handle to negYjog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.InverseK.tool_coord(2)-handles.increment.Value;
handles.IRB940.InverseK.tool_coord(2)=jog;
handles.Ycoord_value.String=num2str(handles.IRB940.InverseK.tool_coord(2));
handles=IRB940_InverseKinematics(handles);
guidata(hObject,handles);


% --- Executes on button press in RZjog.
function RZjog_Callback(hObject, eventdata, handles)
% hObject    handle to RZjog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.InverseK.tool_orient(3)+handles.orient_increment.Value;
handles.IRB940.InverseK.tool_orient(3)=jog;
handles.ZTrot_value.String=num2str(handles.IRB940.InverseK.tool_orient(3));
handles=tool_orientation_replot(handles);
handles=IRB940_InverseKinematics(handles);
guidata(hObject,handles);

% --- Executes on button press in RXjog.
function RXjog_Callback(hObject, eventdata, handles)
% hObject    handle to RXjog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.InverseK.tool_orient(1)+handles.orient_increment.Value;
handles.IRB940.InverseK.tool_orient(1)=jog;
handles.XTrot_value.String=num2str(handles.IRB940.InverseK.tool_orient(1));
handles=tool_orientation_replot(handles);
handles=IRB940_InverseKinematics(handles);
guidata(hObject,handles);

% --- Executes on button press in RYjog.
function RYjog_Callback(hObject, eventdata, handles)
% hObject    handle to RYjog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.InverseK.tool_orient(2)+handles.orient_increment.Value;
handles.IRB940.InverseK.tool_orient(2)=jog;
handles.YTrot_value.String=num2str(handles.IRB940.InverseK.tool_orient(2));
handles=tool_orientation_replot(handles);
handles=IRB940_InverseKinematics(handles);
guidata(hObject,handles);


function orient_increment_Callback(hObject, eventdata, handles)
% hObject    handle to orient_increment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of orient_increment as text
%        str2double(get(hObject,'String')) returns contents of orient_increment as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return  
else
  set(hObject,'Value',input);
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function orient_increment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to orient_increment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
input = str2double(get(hObject,'String'));
set(hObject,'Value',input);
guidata(hObject,handles);
%   display(input);

% --- Executes on button press in negRZjog.
function negRZjog_Callback(hObject, eventdata, handles)
% hObject    handle to negRZjog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.InverseK.tool_orient(3)-handles.orient_increment.Value;
handles.IRB940.InverseK.tool_orient(3)=jog;
handles.ZTrot_value.String=num2str(handles.IRB940.InverseK.tool_orient(3));
handles=tool_orientation_replot(handles);
handles=IRB940_InverseKinematics(handles);
guidata(hObject,handles);

% --- Executes on button press in negRXjog.
function negRXjog_Callback(hObject, eventdata, handles)
% hObject    handle to negRXjog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.InverseK.tool_orient(1)-handles.orient_increment.Value;
handles.IRB940.InverseK.tool_orient(1)=jog;
handles.XTrot_value.String=num2str(handles.IRB940.InverseK.tool_orient(1));
handles=tool_orientation_replot(handles);
handles=IRB940_InverseKinematics(handles);
guidata(hObject,handles);

% --- Executes on button press in negRYjog.
function negRYjog_Callback(hObject, eventdata, handles)
% hObject    handle to negRYjog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.InverseK.tool_orient(2)-handles.orient_increment.Value;
handles.IRB940.InverseK.tool_orient(2)=jog;
handles.YTrot_value.String=num2str(handles.IRB940.InverseK.tool_orient(2));
handles=tool_orientation_replot(handles);
handles=IRB940_InverseKinematics(handles);
guidata(hObject,handles);


% --- Executes on button press in forwardK_output.
function forwardK_output_Callback(hObject, eventdata, handles)
% hObject    handle to forwardK_output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles=IRB940_ForwardKinematics(handles);
guidata(hObject,handles);

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in A1_jog.
function A1_jog_Callback(hObject, eventdata, handles)
% hObject    handle to A1_jog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.axis1.q1+handles.A1_inc.Value;
handles.IRB940.axis1.q1=jog;
handles=IRB940_ForwardKinematics(handles);
guidata(hObject,handles);

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function A1_inc_Callback(hObject, eventdata, handles)
% hObject    handle to A1_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of A1_inc as text
%        str2double(get(hObject,'String')) returns contents of A1_inc as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return  
else
  set(hObject,'Value',input);
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function A1_inc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A1_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
input = str2double(get(hObject,'String'));
set(hObject,'Value',input);
guidata(hObject,handles);
%   display(input);

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in nA1_jog.
function nA1_jog_Callback(hObject, eventdata, handles)
% hObject    handle to nA1_jog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.axis1.q1-handles.A1_inc.Value;
handles.IRB940.axis1.q1=jog;
handles=IRB940_ForwardKinematics(handles);
guidata(hObject,handles);

% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit40_Callback(hObject, eventdata, handles)
% hObject    handle to edit40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit40 as text
%        str2double(get(hObject,'String')) returns contents of edit40 as a double


% --- Executes during object creation, after setting all properties.
function edit40_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Axis1_disp_Callback(hObject, eventdata, handles)
% hObject    handle to Axis1_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Axis1_disp as text
%        str2double(get(hObject,'String')) returns contents of Axis1_disp as a double


% --- Executes during object creation, after setting all properties.
function Axis1_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Axis1_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Axis2_disp_Callback(hObject, eventdata, handles)
% hObject    handle to Axis2_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Axis2_disp as text
%        str2double(get(hObject,'String')) returns contents of Axis2_disp as a double


% --- Executes during object creation, after setting all properties.
function Axis2_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Axis2_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Axis3_disp_Callback(hObject, eventdata, handles)
% hObject    handle to Axis3_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Axis3_disp as text
%        str2double(get(hObject,'String')) returns contents of Axis3_disp as a double


% --- Executes during object creation, after setting all properties.
function Axis3_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Axis3_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Axis4_disp_Callback(hObject, eventdata, handles)
% hObject    handle to Axis4_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Axis4_disp as text
%        str2double(get(hObject,'String')) returns contents of Axis4_disp as a double


% --- Executes during object creation, after setting all properties.
function Axis4_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Axis4_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Axis5_disp_Callback(hObject, eventdata, handles)
% hObject    handle to Axis5_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Axis5_disp as text
%        str2double(get(hObject,'String')) returns contents of Axis5_disp as a double


% --- Executes during object creation, after setting all properties.
function Axis5_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Axis5_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Axis6_disp_Callback(hObject, eventdata, handles)
% hObject    handle to text69 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text69 as text
%        str2double(get(hObject,'String')) returns contents of text69 as a double


% --- Executes during object creation, after setting all properties.
function text69_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text69 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Toolx_disp_Callback(hObject, eventdata, handles)
% hObject    handle to Toolx_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Toolx_disp as text
%        str2double(get(hObject,'String')) returns contents of Toolx_disp as a double


% --- Executes during object creation, after setting all properties.
function Toolx_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Toolx_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Tooly_disp_Callback(hObject, eventdata, handles)
% hObject    handle to Tooly_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tooly_disp as text
%        str2double(get(hObject,'String')) returns contents of Tooly_disp as a double


% --- Executes during object creation, after setting all properties.
function Tooly_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tooly_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Toolz_disp_Callback(hObject, eventdata, handles)
% hObject    handle to Toolz_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Toolz_disp as text
%        str2double(get(hObject,'String')) returns contents of Toolz_disp as a double


% --- Executes during object creation, after setting all properties.
function Toolz_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Toolz_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in A2_jog.
function A2_jog_Callback(hObject, eventdata, handles)
% hObject    handle to A2_jog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.axis2.q2+handles.A2_inc.Value;
handles.IRB940.axis2.q2=jog;
handles=IRB940_ForwardKinematics(handles);
guidata(hObject,handles);


function A2_inc_Callback(hObject, eventdata, handles)
% hObject    handle to A2_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of A2_inc as text
%        str2double(get(hObject,'String')) returns contents of A2_inc as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return  
else
  set(hObject,'Value',input);
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function A2_inc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A2_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
input = str2double(get(hObject,'String'));
set(hObject,'Value',input);
guidata(hObject,handles);
%   display(input);

% --- Executes on button press in nA2_jog.
function nA2_jog_Callback(hObject, eventdata, handles)
% hObject    handle to nA2_jog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.axis2.q2-handles.A2_inc.Value;
handles.IRB940.axis2.q2=jog;
handles=IRB940_ForwardKinematics(handles);
guidata(hObject,handles);

% --- Executes on button press in A3_jog.
function A3_jog_Callback(hObject, eventdata, handles)
% hObject    handle to A3_jog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.axis3.q3+handles.A3_inc.Value;
handles.IRB940.axis3.q3=jog;
handles=IRB940_ForwardKinematics(handles);
guidata(hObject,handles);


function A3_inc_Callback(hObject, eventdata, handles)
% hObject    handle to A3_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of A3_inc as text
%        str2double(get(hObject,'String')) returns contents of A3_inc as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return  
else
  set(hObject,'Value',input);
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function A3_inc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A3_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
input = str2double(get(hObject,'String'));
set(hObject,'Value',input);
guidata(hObject,handles);
%   display(input);

% --- Executes on button press in nA3_jog.
function nA3_jog_Callback(hObject, eventdata, handles)
% hObject    handle to nA3_jog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.axis3.q3-handles.A3_inc.Value;
handles.IRB940.axis3.q3=jog;
handles=IRB940_ForwardKinematics(handles);
guidata(hObject,handles);

% --- Executes on button press in A4_jog.
function A4_jog_Callback(hObject, eventdata, handles)
% hObject    handle to A4_jog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.axis4.q4+handles.A4_inc.Value;
handles.IRB940.axis4.q4=jog;
IRB940_RePlot(handles);
guidata(hObject,handles);


function A4_inc_Callback(hObject, eventdata, handles)
% hObject    handle to A4_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of A4_inc as text
%        str2double(get(hObject,'String')) returns contents of A4_inc as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return  
else
  set(hObject,'Value',input);
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function A4_inc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A4_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
input = str2double(get(hObject,'String'));
set(hObject,'Value',input);
guidata(hObject,handles);
%   display(input);

% --- Executes on button press in nA4_jog.
function nA4_jog_Callback(hObject, eventdata, handles)
% hObject    handle to nA4_jog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.axis4.q4-handles.A4_inc.Value;
handles.IRB940.axis4.q4=jog;
IRB940_RePlot(handles);
guidata(hObject,handles);

% --- Executes on button press in A5_jog.
function A5_jog_Callback(hObject, eventdata, handles)
% hObject    handle to A5_jog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.axis5.q5+handles.A5_inc.Value;
handles.IRB940.axis5.q5=jog;
IRB940_RePlot(handles);
guidata(hObject,handles);


function A5_inc_Callback(hObject, eventdata, handles)
% hObject    handle to A5_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of A5_inc as text
%        str2double(get(hObject,'String')) returns contents of A5_inc as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return  
else
  set(hObject,'Value',input);
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function A5_inc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A5_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
input = str2double(get(hObject,'String'));
set(hObject,'Value',input);
guidata(hObject,handles);
%   display(input);

% --- Executes on button press in nA5_jog.
function nA5_jog_Callback(hObject, eventdata, handles)
% hObject    handle to nA5_jog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.axis5.q5-handles.A5_inc.Value;
handles.IRB940.axis5.q5=jog;
IRB940_RePlot(handles);
guidata(hObject,handles);

% --- Executes on button press in A6_jog.
function A6_jog_Callback(hObject, eventdata, handles)
% hObject    handle to A6_jog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.axis6.q6+handles.A6_inc.Value;
handles.IRB940.axis6.q6=jog;
IRB940_RePlot(handles);
guidata(hObject,handles);

function A6_inc_Callback(hObject, eventdata, handles)
% hObject    handle to A6_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of A6_inc as text
%        str2double(get(hObject,'String')) returns contents of A6_inc as a double
input = str2double(get(hObject,'String'));
if isnan(input)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)
  return  
else
  set(hObject,'Value',input);
  guidata(hObject,handles);
%   display(input);
end

% --- Executes during object creation, after setting all properties.
function A6_inc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A6_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
input = str2double(get(hObject,'String'));
set(hObject,'Value',input);
guidata(hObject,handles);
%   display(input);

% --- Executes on button press in nA6_jog.
function nA6_jog_Callback(hObject, eventdata, handles)
% hObject    handle to nA6_jog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jog=handles.IRB940.axis6.q6-handles.A6_inc.Value;
handles.IRB940.axis6.q6=jog;
IRB940_RePlot(handles);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function Axis6_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Axis6_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in open_file.
function open_file_Callback(hObject, eventdata, handles)
% hObject    handle to open_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.file_data=load_file();
guidata(hObject,handles);

% --- Executes on button press in close_file.
function close_file_Callback(hObject, eventdata, handles)
% hObject    handle to close_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
write_file(handles);


% --- Executes on button press in prev.
function prev_Callback(hObject, eventdata, handles)
% hObject    handle to prev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles=prev_position(handles);
guidata(hObject,handles);

% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles=next_position(handles);
guidata(hObject,handles);

% --- Executes on button press in delete.
function delete_Callback(hObject, eventdata, handles)
% hObject    handle to delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles=delete_position(handles);
guidata(hObject,handles);


% --- Executes on button press in write_mod.
function write_mod_Callback(hObject, eventdata, handles)
% hObject    handle to write_mod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
write_mod(handles);