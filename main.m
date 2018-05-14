function varargout = main(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @main_OpeningFcn, ...
    'gui_OutputFcn',  @main_OutputFcn, ...
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
% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for main
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles)
% Get default command line output from handles structure
varargout{1} = handles.output;

function listbox1_Callback(hObject, eventdata, handles)
i = get(hObject,'Value');
global data filter
patient = data.Patients(data.index(filter(i)));
set(handles.edit2,'String',patient.Name);
function listbox1_CreateFcn(hObject, eventdata, handles)
global data filter
data = Data();
filter = 1:numel(data.index);
set(hObject,'String',data.indexSe);
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit1_Callback(hObject, eventdata, handles)
search = get(hObject,'String');
global data filter
if ~strcmp(search ,'')
    filter = getPatientNameFilter(data,search);
    if filter(1) ~= 0
        set(handles.listbox1,'String',data.indexSe(filter,:));
        set(handles.listbox1,'Value',1);
    else
        set(handles.listbox1,'String','');
        set(handles.listbox1,'Value',1);
        filter = 1:numel(data.index);
    end
else
    filter = 1:numel(data.index);
end
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ExportButton_Callback(hObject, eventdata, handles)
path = uigetdir('','selecione la carpeta con la hitoria clinica de los pacientes');
global data filter
if path ~=0
    data = export(data,path);
    filter = 1:numel(data.index);
    set(handles.listbox1,'Value',1);
    set(handles.listbox1,'String',data.indexSe);
    save(data);
end
