function varargout = interfaz_201613162_0(varargin)
% INTERFAZ_201613162_0 MATLAB code for interfaz_201613162_0.fig
%      INTERFAZ_201613162_0, by itself, creates a new INTERFAZ_201613162_0 or raises the existing
%      singleton*.
%
%      H = INTERFAZ_201613162_0 returns the handle to a new INTERFAZ_201613162_0 or the handle to
%      the existing singleton*.
%
%      INTERFAZ_201613162_0('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZ_201613162_0.M with the given input arguments.
%
%      INTERFAZ_201613162_0('Property','Value',...) creates a new INTERFAZ_201613162_0 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfaz_201613162_0_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfaz_201613162_0_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfaz_201613162_0

% Last Modified by GUIDE v2.5 12-Apr-2018 09:00:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @interfaz_201613162_0_OpeningFcn, ...
    'gui_OutputFcn',  @interfaz_201613162_0_OutputFcn, ...
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


% --- Executes just before interfaz_201613162_0 is made visible.
function interfaz_201613162_0_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfaz_201613162_0 (see VARARGIN)
global alumnos;
alumnos = repmat(struct('nombres','','apellidos','','codigo','','notas',[0,0,0,0]),[1,1]);

% Choose default command line output for interfaz_201613162_0
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfaz_201613162_0 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfaz_201613162_0_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function listbox1_CreateFcn(hObject, eventdata, handles)
set(hObject,'String',{});
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject, handles);

function newNombres_Callback(hObject, eventdata, handles)
function newNombres_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function newApellidos_Callback(hObject, eventdata, handles)
function newApellidos_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function newCodigo_Callback(hObject, eventdata, handles)
function newCodigo_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function parcial_Callback(hObject, eventdata, handles)
function parcial_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function lab_Callback(hObject, eventdata, handles)
function lab_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function proyecto_Callback(hObject, eventdata, handles)
function proyecto_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function BotonGuardar_Callback(hObject, eventdata, handles)
nombres = get(handles.newNombres,'String');
apellidos = get(handles.newApellidos,'String');
codigos= get(handles.newCodigo,'String');
parcial= get(handles.parcial,'String');
lab= get(handles.lab,'String');
proyecto= get(handles.proyecto,'String');

if ~isempty(nombres) && ~isempty(apellidos) && ~isempty(codigos)  && ~isempty(parcial)  && ~isempty(lab)  && ~isempty(proyecto)
    if all(ismember(codigos, '0123456789')) && all(ismember(parcial, '0123456789.')) && all(ismember(lab, '0123456789.')) && all(ismember(proyecto, '0123456789.'))
        parcial = str2double(parcial);
        lab = str2double(lab);
        proyecto = str2double(proyecto);
        if parcial<=5 && lab<=5 && proyecto <=5
            global alumnos;
            
            definitiva = parcial*0.6+lab*0.25+proyecto*0.15;
            [n,m] = size(alumnos);
            alumnos(m+1).nombres=nombres;
            alumnos(m+1).apellidos=apellidos;
            alumnos(m+1).codigo=codigos;
            alumnos(m+1).notas=[parcial,lab,proyecto,definitiva];
            
            set(handles.newNombres,'String','');
            set(handles.newApellidos,'String','');
            set(handles.newCodigo,'String','')
            set(handles.parcial,'String','');
            set(handles.lab,'String','');
            set(handles.proyecto,'String','');
            
            Afields = fieldnames(alumnos);
            Acell = struct2cell(alumnos);
            sz = size(Acell);
            Acell = reshape(Acell, sz(1), []);
            Acell = Acell';
            Acell = sortrows(Acell, 3);
            Acell = reshape(Acell', sz);
            alumnos = cell2struct(Acell, Afields, 1);
            
            pos = 1;
            for j=1:length(alumnos)
                if strcmp(codigos,alumnos(j).codigo)
                    pos=j;
                    break;
                end
            end
            
            set(handles.tCodigo,'String',alumnos(pos).codigo);
            set(handles.tApellidos,'String',alumnos(pos).apellidos);
            set(handles.tNombres,'String',alumnos(pos).nombres);
            set(handles.edit7,'String',alumnos(pos).notas(1));
            set(handles.edit8,'String',alumnos(pos).notas(2));
            set(handles.edit9,'String',alumnos(pos).notas(3));
            set(handles.definitiva,'String',alumnos(pos).notas(4));
            set(handles.listbox1,'Value',pos);
            set(handles.listbox1,'String',{alumnos.codigo});
            
            x = [alumnos.notas];
            x = x(4:4:length(x));
            if length(x) > 1
                histogram(x(2:end),0:0.5:5);
            end
        else
            errordlg('las notas no pueden ser superirores a 5','error');
        end
    else
        errordlg('digite numeros en los campos correspondientes','error');
    end
else
    errordlg('llene todos los campos','error');
end

function listbox1_Callback(hObject, eventdata, handles)
i = get(hObject,'Value');
global alumnos;
set(handles.tCodigo,'String',alumnos(i).codigo);
set(handles.tApellidos,'String',alumnos(i).apellidos);
set(handles.tNombres,'String',alumnos(i).nombres);
set(handles.edit7,'String',alumnos(i).notas(1));
set(handles.edit8,'String',alumnos(i).notas(2));
set(handles.edit9,'String',alumnos(i).notas(3));
set(handles.definitiva,'String',alumnos(i).notas(4));

function edit7_Callback(hObject, eventdata, handles)
function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit8_Callback(hObject, eventdata, handles)
function edit8_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit9_Callback(hObject, eventdata, handles)
function edit9_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton2_Callback(hObject, eventdata, handles)
pos= get(handles.listbox1,'Value');
if pos >1
    set(handles.tCodigo,'String',''); 
    set(handles.tApellidos,'String','');
    set(handles.tNombres,'String','');
    set(handles.edit7,'String','');
    set(handles.edit8,'String','');
    set(handles.edit9,'String','');
    set(handles.definitiva,'String','');
    
    global alumnos;
    alumnos(pos) = [];
    set(handles.listbox1,'Value',1);
    set(handles.listbox1,'String',{alumnos.codigo});
    
    x = [alumnos.notas];
    x = x(4:4:length(x));
    if length(x) > 1
        histogram(x(2:end),0:0.5:5);
    end
end

function pushbutton3_Callback(hObject, eventdata, handles)
global alumnos;
parcial = get(handles.edit7,'String');
lab = get(handles.edit8,'String');
proyecto = get(handles.edit9,'String');
i = get(handles.listbox1,'Value');
if all(ismember(parcial, '0123456789.')) && all(ismember(lab, '0123456789.')) && all(ismember(proyecto, '0123456789.'))
    parcial = str2double(parcial);
    lab = str2double(lab);
    proyecto = str2double(proyecto);
    if parcial<=5 && lab<=5 && proyecto <=5
        definitiva = parcial*0.6+lab*0.25+proyecto*0.15;
        
        alumnos(i).notas = [parcial,lab,proyecto,definitiva];
        set(handles.definitiva,'String',definitiva);
        
        x = [alumnos.notas];
        x = x(4:4:length(x));
        if length(x) > 1
            histogram(x(2:end),0:0.5:5);
        end
    else
        errordlg('las notas no pueden ser superirores a 5','error');
    end
else
    errordlg('digite numeros en los campos correspondientes','error');
end


function tCodigo_Callback(hObject, eventdata, handles)
function tCodigo_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function tApellidos_Callback(hObject, eventdata, handles)
function tApellidos_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function tNombres_Callback(hObject, eventdata, handles)
function tNombres_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function definitiva_Callback(hObject, eventdata, handles)
function definitiva_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
