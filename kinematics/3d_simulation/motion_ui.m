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

    % Last Modified by GUIDE v2.5 25-Apr-2017 12:25:46

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

    

end
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
    
    set(handles.figure1,'Position', [140   20  70.0000   23.1538]);

    

end

% --- Outputs from this function are returned to the command line.
function varargout = motion_ui_OutputFcn(hObject, eventdata, handles) 
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Get default command line output from handles structure
    varargout{1} = handles.output;

end

function x_target_text_Callback(hObject, eventdata, handles)

    % hObject    handle to x_target_text (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of x_target_text as text
    %        str2double(get(hObject,'String')) returns contents of x_target_text as a double
end


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

end

function y_target_text_Callback(hObject, eventdata, handles)
    % hObject    handle to y_target_text (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of y_target_text as text
    %        str2double(get(hObject,'String')) returns contents of y_target_text as a double

end

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

end

function z_target_text_Callback(hObject, eventdata, handles)
    % hObject    handle to z_target_text (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of z_target_text as text
    %        str2double(get(hObject,'String')) returns contents of z_target_text as a double

end

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

end

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
    % hObject    handle to listbox1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
    %        contents{get(hObject,'Value')} returns selected item from listbox1

end

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

end

% --- Executes during object creation, after setting all properties.
function joint_type_choose_CreateFcn(hObject, eventdata, handles)


    % hObject    handle to joint_type_choose (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

end
% --- Executes on selection change in joint_type_choose.
function joint_type_choose_Callback(hObject, eventdata, handles)

end

function target_type_choose_Callback(hObject, eventdata, handles)
    % hObject    handle to target_type_choose (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: contents = cellstr(get(hObject,'String')) returns target_type_choose contents as cell array
    %        contents{get(hObject,'Value')} returns selected item from target_type_choose

end

% --- Executes during object creation, after setting all properties.
function target_type_choose_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to target_type_choose (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: popupmenu controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

end


% --- Executes on button press in move_button.
function move_button_Callback(hObject, eventdata, handles)


    x_target = get(handles.x_target_text, 'String');
    y_target = get(handles.y_target_text, 'String');
    z_target = get(handles.z_target_text, 'String');
    
    
    if(~isempty(x_target) & ~isempty(y_target) & ~isempty(z_target))
        
        %Only procedd if there is input in the cells
        x_target = str2double(x_target);
        y_target = str2double(y_target);
        z_target = str2double(z_target);
        
        target = [x_target; y_target; z_target];
        target_b = target'; 
        
        theta_b = 0;
        
        %Load the inital thetas and target values (for joint and target
        %control
        load('theta_a.mat', 'theta_a');
        load('target_a.mat', 'target_a');


        joint_type = get(handles.joint_type_choose, 'Value');
        target_type = get(handles.target_type_choose, 'Value');

        is_joint = get(handles.joint_select, 'Value');
        is_target = get(handles.target_select, 'Value');
        is_plot_trajectory = get(handles.plot_trajectory_select, 'Value');
        is_plot_graph = get(handles.plot_graph_select, 'Value');

        if(is_joint)
            
            theta_b = ik_pseudo_inverse(target);
            theta_b = theta_b';
            
            %For each condition, check if a solution is possible
           	if(joint_type == 1 & theta_b~=-1)
                %Uniform
                move_to_theta_uniform(theta_a, theta_b);
                
            elseif(joint_type == 2 & theta_b~=-1)
                %Linear
                
                n0 = 0;
                nf = 100;
                move_to_theta_linear(theta_a, theta_b, n0, nf, is_plot_graph);
                
                
            elseif(joint_type == 3 & theta_b~=-1)
                
                %Cubic
                n0 = 0;
                nf = 100;
                %Initial and final velocities
                % Not absolute velocities. Iteration velocities
                dq0 = 0; 
                dqf = 0;

                move_to_theta_cubic(theta_a, theta_b, n0, nf, dq0, dqf, is_plot_graph);
                
            elseif(joint_type == 4 & theta_b~=-1)
                
                %Rest to rest with constant velocity
                n0 = 0;
                nf = 100;
                n1 = 10;
                n2 = 90;
                dqc = 0.01;
                
                move_to_theta_constant(theta_a, theta_b, n0, n1, n2, nf, is_plot_graph);
                
            end
                
        end

        if(is_target)

            if(target_type==1)
                
                n0 = 0;
                nf = 100;
                
                theta_b = move_to_target_linear(theta_a, target_a, target_b, n0, nf, is_plot_trajectory, is_plot_graph);
                
            elseif(target_type==2)
                
                %Linear with control over velocity and acceleration
                n0 = 0;
                nf = 100;
                
                %Initial and final target velocities
                dt0 = 0;
                dtf = 0;
                
                %Initial and final target accelerations
                ddt0 = 0;
                ddtf = 0;
                
                theta_b = move_to_target_linear_quintic(theta_a, target_a, target_b, n0, nf, dt0, dtf, ddt0, ddtf, is_plot_trajectory, is_plot_graph);
                
            end

        end
        
        
        %Update theta_a
        theta_a = theta_b;
        target_a = target_b;
        
        %saving theta_a and target_a
        save('theta_a.mat', 'theta_a');
        save('target_a.mat', 'target_a');
        
        
    end
        
          
    
    
end


% --- Executes on button press in joint_select.
function joint_select_Callback(hObject, eventdata, handles)
    % hObject    handle to joint_select (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hint: get(hObject,'Value') returns toggle state of joint_select

    %deselect the other radio button
    set(handles.target_select, 'Value', 0);

end


% --- Executes on button press in target_select.
function target_select_Callback(hObject, eventdata, handles)
    % hObject    handle to target_select (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hint: get(hObject,'Value') returns toggle state of target_select

    %deselect the other radio button
    set(handles.joint_select, 'Value', 0);

end


% --- Executes on button press in plot_trajectory_select.
function plot_trajectory_select_Callback(hObject, eventdata, handles)
% hObject    handle to plot_trajectory_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of plot_trajectory_select
end


% --- Executes on button press in plot_graph_select.
function plot_graph_select_Callback(hObject, eventdata, handles)
% hObject    handle to plot_graph_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of plot_graph_select
end