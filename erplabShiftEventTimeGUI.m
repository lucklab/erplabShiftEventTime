function varargout = erplabShiftEventTimeGUI(varargin)
% ERPLABSHIFTEVENTTIMEGUI MATLAB code for erplabShiftEventTimeGUI.fig
%      ERPLABSHIFTEVENTTIMEGUI, by itself, creates a new ERPLABSHIFTEVENTTIMEGUI or raises the existing
%      singleton*.
%
%      H = ERPLABSHIFTEVENTTIMEGUI returns the handle to a new ERPLABSHIFTEVENTTIMEGUI or the handle to
%      the existing singleton*.
%
%      ERPLABSHIFTEVENTTIMEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ERPLABSHIFTEVENTTIMEGUI.M with the given input arguments.
%
%      ERPLABSHIFTEVENTTIMEGUI('Property','Value',...) creates a new ERPLABSHIFTEVENTTIMEGUI or raises
%      the existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before erplabShiftEventTimeGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to erplabShiftEventTimeGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help erplabShiftEventTimeGUI

% Last Modified by GUIDE v2.5 31-Mar-2016 15:54:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @erplabShiftEventTimeGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @erplabShiftEventTimeGUI_OutputFcn, ...
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

% --- Executes just before erplabShiftEventTimeGUI is made visible.
function erplabShiftEventTimeGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to erplabShiftEventTimeGUI (see VARARGIN)

% Choose default command line output for erplabShiftEventTimeGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);

% UIWAIT makes erplabShiftEventTimeGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = erplabShiftEventTimeGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
% function density_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to editboxReplaceChannels (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: popupmenu controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end



% function density_Callback(hObject, eventdata, handles)
% % hObject    handle to editboxReplaceChannels (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of editboxReplaceChannels as text
% %        str2double(get(hObject,'String')) returns contents of editboxReplaceChannels as a double
% editboxReplaceChannels = str2double(get(hObject, 'String'));
% if isnan(editboxReplaceChannels)
%     set(hObject, 'String', 0);
%     errordlg('Input must be a number','Error');
% end
% 
% % Save the new editboxReplaceChannels value
% handles.metricdata.editboxReplaceChannels = editboxReplaceChannels;
% guidata(hObject,handles)
% 
% % --- Executes during object creation, after setting all properties.
% function volume_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to editboxIgnoreChannels (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: popupmenu controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
% 
% 
% 
% function volume_Callback(hObject, eventdata, handles)
% % hObject    handle to editboxIgnoreChannels (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of editboxIgnoreChannels as text
% %        str2double(get(hObject,'String')) returns contents of editboxIgnoreChannels as a double
% editboxIgnoreChannels = str2double(get(hObject, 'String'));
% if isnan(editboxIgnoreChannels)
%     set(hObject, 'String', 0);
%     errordlg('Input must be a number','Error');
% end
% 
% % Save the new editboxIgnoreChannels value
% handles.metricdata.editboxIgnoreChannels = editboxIgnoreChannels;
% guidata(hObject,handles)

% --- Executes on button press in shift_events.
function shift_events_Callback(hObject, eventdata, handles)
% hObject    handle to shift_events (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

mass = handles.metricdata.density * handles.metricdata.volume;
set(handles.mass, 'String', mass);

% --- Executes on button press in cancel.
function cancel_Callback(hObject, eventdata, handles)
% hObject    handle to cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

initialize_gui(gcbf, handles, true);

% --- Executes when selected object changed in uipanelRounding.
function uipanelRounding_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanelRounding 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (hObject == handles.radioBtnNearest)
    handles.roundingInput = 'nearest';
elseif (hObject == handles.radioBtnFloor)
    handles.roundingInput = 'floor';
elseif (hObject == handles.radioBtnCeiling)
    handles.roundingInput = 'ceiling';
end

% Save the new rounding value
guidata(hObject,handles)




% --------------------------------------------------------------------
function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the cancel flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to cancel the data.

% if isfield(handles, 'metricdata') && ~isreset
%     return;
% end
% 
% handles.metricdata.editboxReplaceChannels = 0;
% handles.metricdata.editboxIgnoreChannels  = 0;
% 
% set(handles.editboxReplaceChannels, 'String', handles.metricdata.editboxReplaceChannels);
% set(handles.editboxIgnoreChannels,  'String', handles.metricdata.editboxIgnoreChannels);
% set(handles.mass, 'String', 0);



set(handles.uipanelRounding, 'SelectedObject', handles.radioBtnNearest);

handles.roundingInput           = 'nearest';
handles.replaceChannelsInput    = [];
handles.ignoreChannelsInput     = [];
 

% Update handles structure
guidata(handles.figure1, handles);


% --- Executes on key press with focus on shift_events and none of its controls.
function shift_events_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to shift_events (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function editboxReplaceChannels_Callback(hObject, eventdata, handles)
% hObject    handle to editboxReplaceChannels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editboxReplaceChannels as text
%        str2double(get(hObject,'String')) returns contents of editboxReplaceChannels as a double

% Using `str2num` (vs `str2double`) to handle both string arrray input and
% single string/character input
handles.ignoreChannelsInput = str2num(get(hObject,'String'));

% Save the new replace channels value
guidata(hObject,handles)


function editboxIgnoreChannels_Callback(hObject, eventdata, handles)
% hObject    handle to editboxIgnoreChannels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editboxIgnoreChannels as text
%        str2double(get(hObject,'String')) returns contents of editboxIgnoreChannels as a double

handles.ignoreChannelsInput = str2num(get(hObject,'String'));

% Save the new ignore channels value
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function editboxIgnoreChannels_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editboxIgnoreChannels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
