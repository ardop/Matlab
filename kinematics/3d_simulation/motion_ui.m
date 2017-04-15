function varargout = motion_ui(varargin)
% MOTION_UI MATLAB code for motion_ui.fig
%      MOTION_UI, by itself, creates a new MOTION_UI or raises the existing
%      singleton*.
%
%      H = MOTION_UI returns the handle to a new MOTION_UI or the handle to
%      the existing singleton*.
%
%      MOTION_UI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOTION_UI.M with the given input arguments.
%
%      MOTION_UI('Property','Value',...) creates a new MOTION_UI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before motion_ui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to motion_ui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help motion_ui

% Last Modified by GUIDE v2.5 15-Apr-2017 20:44:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @motion_ui_OpeningFcn, ...
                   'gui_OutputFcn',  @motion_ui_OutputFcn, ...
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


% --- Executes just before motion_ui is made visible.
function motion_ui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to motion_ui (see VARARGIN)

% Choose default command line output for motion_ui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes motion_ui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = motion_ui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function x_target_text_Callback(hObject, eventdata, handles)

% hObject    handle to x_target_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_target_text as text
%        str2double(get(hObject,'String')) returns contents of x_target_text as a double


% --- Executes during object creation, after setting all properties.
function x_target_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_target_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y_target_text_Callback(hObject, eventdata, handles)
% hObject    handle to y_target_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_target_text as text
%        str2double(get(hObject,'String')) returns contents of y_target_text as a double


% --- Executes during object creation, after setting all properties.
function y_target_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_target_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z_target_text_Callback(hObject, eventdata, handles)
% hObject    handle to z_target_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z_target_text as text
%        str2double(get(hObject,'String')) returns contents of z_target_text as a double


% --- Executes during object creation, after setting all properties.
function z_target_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_target_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function control_type_choose_CreateFcn(hObject, eventdata, handles)

    
% hObject    handle to control_type_choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in control_type_choose.
function control_type_choose_Callback(hObject, eventdata, handles)


% hObject    handle to control_type_choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns control_type_choose contents as cell array
%        contents{get(hObject,'Value')} returns selected item from control_type_choose


% --- Executes on selection change in motion_type_choose.
function motion_type_choose_Callback(hObject, eventdata, handles)
% hObject    handle to motion_type_choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns motion_type_choose contents as cell array
%        contents{get(hObject,'Value')} returns selected item from motion_type_choose


% --- Executes during object creation, after setting all properties.
function motion_type_choose_CreateFcn(hObject, eventdata, handles)
% hObject    handle to motion_type_choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in move_button.
function move_button_Callback(hObject, eventdata, handles)

    x_target = str2double(get(handles.x_target_text, 'String'));
    y_target = str2double(get(handles.y_target_text, 'String'));
    z_target = str2double(get(handles.z_target_text, 'String'));
    
    control_type = get(handles.control_type_choose, 'Value');
    motion_type = get(handles.motion_type_choose, 'Value');
    
    

% hObject    handle to move_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
