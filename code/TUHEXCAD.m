function varargout = TUHEXCAD(varargin)
% TUHEXCAD MATLAB code for TUHEXCAD.fig
%      TUHEXCAD, by itself, creates a new TUHEXCAD or raises the existing
%      singleton*.
%
%      H = TUHEXCAD returns the handle to a new TUHEXCAD or the handle to
%      the existing singleton*.
%
%      TUHEXCAD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUHEXCAD.M with the given input arguments.
%
%      TUHEXCAD('Property','Value',...) creates a new TUHEXCAD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TUHEXCAD_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TUHEXCAD_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE'ft Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TUHEXCAD

% Last Modified by GUIDE v2.5 13-May-2021 13:13:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TUHEXCAD_OpeningFcn, ...
                   'gui_OutputFcn',  @TUHEXCAD_OutputFcn, ...
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


% --- Executes just before TUHEXCAD is made visible.
function TUHEXCAD_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TUHEXCAD (see VARARGIN)

% Choose default command line output for TUHEXCAD

handles.output = hObject;
axes(handles.axes1);
imshow('forms.png');
global mat resx rx
mat=xlsread('mat.xlsx');
resx=cell([100,16]);
resx(1,1)={'Form'};resx(1,2)={'Material'};resx(1,3)={'Strength coefficient (K)'};resx(1,4)={'Strain hardening exponent (n)'};resx(1,5)={'Flow Stress (Ks)'};resx(1,6)={'Outer Diameter'};resx(1,7)={'Lower Diameter'};resx(1,8)={'Upper Hole'};resx(1,9)={'Lower Hole'};resx(1,10)={'Upper Height'};resx(1,11)={'Middle Height'};resx(1,12)={'Lower Height'};resx(1,13)={'Force (N)'};resx(1,14)={'Force (ton)'};resx(1,15)={'Initial Height'};resx(1,16)={'Case'};
rx=2; 
set(handles.matselr,'value',1);
set(handles.matinsr,'value',0);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TUHEXCAD wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TUHEXCAD_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in matinsr.
function matinsr_Callback(hObject, eventdata, handles)
% hObject    handle to matinsr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global b;
b=2;
set(handles.matsel,'visible','off')
set(handles.kt,'visible','on');
set(handles.ke,'visible','on');
set(handles.nt,'visible','on');
set(handles.ne,'visible','on');




% Hint: get(hObject,'Value') returns toggle state of matinsr


% --- Executes on selection change in matsel.
function matsel_Callback(hObject, eventdata, handles)
% hObject    handle to matsel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c stpf stpb mat i rx resx b
b=1;
c = get(hObject,'value');

if c>1
i=c-1;

    stpf=mat(i,11);     %stpf:forward permissible strain
    stpb=mat(i,12);
    set(handles.gg,'visible','off')
else
    set(handles.gg,'visible','on')
end


        
% Hints: contents = cellstr(get(hObject,'String')) returns matsel contents as cell array
%        contents{get(hObject,'Value')} returns selected item from matsel


% --- Executes during object creation, after setting all properties.
function matsel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to matsel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ke_Callback(hObject, eventdata, handles)
% hObject    handle to ke (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ke as text
%        str2double(get(hObject,'String')) returns contents of ke as a double
global k
k=str2double(get(handles.ke,'string'));
set(handles.ne,'enable','on');
kk=get(handles.ke,'string');
if isempty(kk)
    set(handles.gg,'visible','on');
end

if k<=0
    sound(sin(1:3000));
    set(handles.wrg,'visible','on');
    set(handles.wr1,'string','Illogical value');
    set(handles.ke,'foregroundcolor','red')
else
    set(handles.wrg,'visible','off');
    set(handles.ke,'foregroundcolor','black')
end   
   

% --- Executes during object creation, after setting all properties.
function ke_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ke (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    
end



function ne_Callback(hObject, eventdata, handles)
% hObject    handle to ne (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ne as text
%        str2double(get(hObject,'String')) returns contents of ne as a double


global k ks stpb stpf resx rx n
n=get(handles.ne,'string');
stpb=-0.0038*k+3.9367; stpf=-0.0044+4.4491; 

if isempty(n)
    set(handles.gg,'visible','on');
end
nn=str2double(n);
if nn<=0
    sound(sin(1:3000));
    set(handles.wrg,'visible','on');
    set(handles.wr1,'string','Illogical value');
    set(handles.ne,'foregroundcolor','red')
else
    set(handles.wrg,'visible','off');
    set(handles.ne,'foregroundcolor','black')
end

 

% --- Executes during object creation, after setting all properties.
function ne_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ne (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stpbe_Callback(hObject, eventdata, handles)
% hObject    handle to stpbe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stpbe as text
%        str2double(get(hObject,'String')) returns contents of stpbe as a double


% --- Executes during object creation, after setting all properties.
function stpbe_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stpbe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on matinsr and none of its controls.
function matinsr_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to matinsr (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(ft) that was pressed
%	Modifier: name(ft) of the modifier key(ft) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in formsel.
function formsel_Callback(hObject, eventdata, handles)
% hObject    handle to formsel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a rx resx;
    a = get(hObject,'value');
    set(handles.resg,'visible','off');
    switch a
    case 1
        set(handles.g1,'visible','on');
        set(handles.g2,'visible','off');
        set(handles.g3,'visible','off');
        set(handles.g4,'visible','off');
    case 2
        set(handles.g1,'visible','off');
        set(handles.g2,'visible','on');
        set(handles.g3,'visible','off');
        set(handles.g4,'visible','off');
        axes(handles.axes2)
        imshow('rod1.png')
 %Return to the initial interface in the event that a new problem is opened after solving another one
    set(handles.Tuw,'string','')
    set(handles.Tlw,'string','')
    set(handles.Tuh,'string','')
    set(handles.Tlh,'string','')
    set(handles.Tlw,'enable','off')
    set(handles.Tuh,'enable','off')
    set(handles.Tlh,'enable','off')
    case 3
        set(handles.g1,'visible','off');
        set(handles.g2,'visible','off');
        set(handles.g3,'visible','on');
        set(handles.g4,'visible','off');
        axes(handles.axes11)
        imshow('can1.png')
  %Return to the initial interface in the event that a new problem is opened after solving another one
    set(handles.Uuw,'string','')
    set(handles.Ulw,'string','')
    set(handles.Uuh,'string','')
    set(handles.Ulh,'string','')
    set(handles.Uuw,'enable','off')
    set(handles.Uuh,'enable','off')
    set(handles.Ulh,'enable','off')
    case 4
        set(handles.g1,'visible','off');
        set(handles.g2,'visible','off');
        set(handles.g3,'visible','off');
        set(handles.g4,'visible','on');
        axes(handles.axes12)
        imshow('can-can1.png')
  %Return to the initial interface in the event that a new problem is opened after solving another one
    set(handles.Huw,'string','')
    set(handles.Huw2,'string','')
    set(handles.Huh,'string','')
    set(handles.Hmh,'string','')
    set(handles.Hlh,'string','')
    set(handles.Hlw,'string','')
    set(handles.Hlw,'enable','off')
    set(handles.Huh,'enable','off')
    set(handles.Hlh,'enable','off')
    set(handles.Hmh,'enable','off')
    end
i=get(handles.matsel,'value');
o=get(handles.ke,'value');
p=get(handles.ne,'value');
if (i==1) & (o==0|p==0)   
    set(handles.gg,'visible','on');
end


% Hints: contents = cellstr(get(hObject,'String')) returns formsel contents as cell array
%        contents{get(hObject,'Value')} returns selected item from formsel


% --- Executes during object creation, after setting all properties.
function formsel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to formsel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over matinsr.
function matinsr_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to matinsr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in matselr.
function matselr_Callback(hObject, eventdata, handles)
% hObject    handle to matselr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global b;
b=1;
set(handles.kt,'visible','off');
set(handles.ke,'visible','off');
set(handles.nt,'visible','off');
set(handles.ne,'visible','off');
set(handles.matsel,'visible','on');

% Hint: get(hObject,'Value') returns toggle state of matselr






function Tlh_Callback(hObject, eventdata, handles)
% hObject    handle to Tlh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tlh as text
%        str2double(get(hObject,'String')) returns contents of Tlh as a double
global h2
h2=str2double(get(handles.Tlh,'string'));

% --- Executes during object creation, after setting all properties.
function Tlh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tlh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Tlw_Callback(hObject, eventdata, handles)
% hObject    handle to Tlw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tlw as text
%        str2double(get(hObject,'String')) returns contents of Tlw as a double
global d1 d1ul d1ll input rx resx
d1=str2double(get(handles.Tlw,'string'));
global d0ul d0ll
input=str2double(get(handles.Tlw,'string'));
if (input>d1ul)|(input<d1ll)
    sound(sin(1:3000));
    set(handles.wr1,'string','Unacceptable value Please check the range limits')
    set(handles.wrg,'visible','on');
    set(handles.Tuh,'enable','off');
    set(handles.Tlh,'enable','off');
    set(handles.Tuw,'enable','off');
    set(handles.Tlw,'foregroundcolor','red');
set(handles.solve,'enable','off');

else
    set(handles.wrg,'visible','off');
    set(handles.Tuh,'enable','on');
    set(handles.Tlh,'enable','on');
    set(handles.Tuw,'enable','on');
    set(handles.Tlw,'foregroundcolor','black');
set(handles.solve,'enable','on');
end

% --- Executes during object creation, after setting all properties.
function Tlw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tlw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Tuw_Callback(hObject, eventdata, handles)
% hObject    handle to Tuw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global d0ul d0ll
input=str2double(get(handles.Tuw,'string'));
if (input>d0ul)|(input<d0ll)
    sound(sin(1:3000));
    set(handles.wr1,'string','Unacceptable value Please observe the rang limits')
    set(handles.wrg,'visible','on');
    set(handles.Tuh,'enable','off');
    set(handles.Tlh,'enable','off');
    set(handles.Tlw,'enable','off');
    set(handles.Tuw,'foregroundcolor','red');
else
    set(handles.wrg,'visible','off');
    set(handles.Tuh,'enable','on');
    set(handles.Tlh,'enable','on');
    set(handles.Tlw,'enable','on');
    set(handles.Tuw,'foregroundcolor','black');
end

    
% Hints: get(hObject,'String') returns contents of Tuw as text
%        str2double(get(hObject,'String')) returns contents of Tuw as a double


% --- Executes during object creation, after setting all properties.
function Tuw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tuw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on Tuw and none of its controls.
function Tuw_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Tuw (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(ft) that was pressed
%	Modifier: name(ft) of the modifier key(ft) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global d0ul d0ll
d0ul=80; d0ll=0.5;
set(handles.Tuwg,'visible','on')
set(handles.Tlwg,'visible','off')
 set(handles.Tuwt1,'string',d0ll)
set(handles.Tuwt3,'string',d0ul)
function Tuh_Callback(hObject, eventdata, handles)
% hObject    handle to Tuh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h1
h1=str2double(get(handles.Tuh,'string'));
        
% Hints: get(hObject,'String') returns contents of Tuh as text
%        str2double(get(hObject,'String')) returns contents of Tuh as a double


% --- Executes during object creation, after setting all properties.
function Tuh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tuh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on Tuh and none of its controls.
function Tuh_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Tuh (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(ft) that was pressed
%	Modifier: name(ft) of the modifier key(ft) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on key press with focus on Tlh and none of its controls.
function Tlh_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Tlh (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(ft) that was pressed
%	Modifier: name(ft) of the modifier key(ft) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on key press with focus on Tlw and none of its controls.
function Tlw_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Tlw (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(ft) that was pressed
%	Modifier: name(ft) of the modifier key(ft) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global d1ul d1ll d0ul d0ll d0 stpf
d0ul=80; d0ll=0.5; d0=str2double(get(handles.Tuw,'string'));
         d1ul=d0-1;
         d1ll=d0/exp(stpf);
set(handles.Tuwg,'visible','off')
set(handles.Tlwg,'visible','on')
 set(handles.Tlwt1,'string',d1ll)
set(handles.Tlwt3,'string',d1ul)


% --- Executes on button press in solve.
function solve_Callback(hObject, eventdata, handles)
% hObject    handle to solve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a b i k n dp ks d0 d1 d2 h1 h2 h3 st mat rx resx;
if a==2
resx{rx,1}='Rod';
elseif a==3
resx{rx,1}='can';
elseif a==4  
resx{rx,1}='Can-Can';   
end

%% strain st
n=str2double(get(handles.ne,'string'));
 switch a
    case 2
        dp=d0;
        st=log((d0^2)/(d1^2));

    case 3
           d0=str2double(get(handles.Ulw,'string'));
   d1=str2double(get(handles.Uuw,'string'));
   h1=str2double(get(handles.Uuh,'string'));
   h2=str2double(get(handles.Ulh,'string'));
           dp=d1;
           h0=(pi/4*((d0^2)*h2+((d0^2)-(d1^2))*h1))/(pi/4*(d0^2));
           s=(d0-d1)/2;
           %strain
           if(d0/s)<=10  
           st=log((dp^2)/(d0^2-d1^2));
           else
               st=log(d0/(d0-dp))-.16; 
          end
          
    case 4
   d0=str2double(get(handles.Huw,'string'));
   d1=str2double(get(handles.Huw2,'string'));
   d2=str2double(get(handles.Hlw,'string'));
   h1=str2double(get(handles.Huh,'string'));
   h2=str2double(get(handles.Hlh,'string'));
   h3=str2double(get(handles.Hmh,'string'));
           dp=d1; 
           s=(d0-d1)/2;
            h0=(pi/4*((d0^2)*h3+((d0^2)-(d1^2))*h1)+(((d0^2)-(d2^2))*h2))/(pi/4*(d0^2));
            
           %strain backward
           if(d0/s)<=10  
           st1=log((dp^2)/((d0^2)-(d1^2)));
         
           else
               st1=log(d0/(d0-dp))-.16; 
        
           end
           %strain forward
            dp1=d2;
        st2=log((d0^2)/((d0^2)-(d1^2)));
       
 end
  %% flow stress
 
 if b==1
knm=xlsread('K-values.xlsx');
exk={'Al 99.8'; 'AlMgSi 1' ; 'CuZn 37 (Ms 63)' ; '42 CrMo 4' ; '15 CrNi 6' ; 'Ma 8' ; 'Ck 10' ; 'Ck 15 / Cq 15' ; 'Cq 22' ; 'Cq 35' ; 'Ck 45 / Cq 45' ; '16 MnCr 5'};
resx(rx,2)=exk(i,1);
resx(rx,3)={[knm(i,1)]};
resx(rx,4)={[knm(i,2)]};
    ks1= mat(i,1);
    
   if st<=.1
     ks2=mat(i,2);
   elseif st<=.2
      ks2=mat(i,3);
   elseif st<=.4
     ks2=mat(i,4);
   elseif st<=.6
      ks2=mat(i,5);
   elseif st<=.8
       ks2=mat(i,6);
   elseif st<=1
      ks2=mat(i,7);
   elseif st<=1.2
     ks2=mat(i,8);
   elseif st<=1.4
      ks2=mat(i,9);
   else
      ks2=mat(i,10);
   end
    ks=(ks1+ks2)/2;  
resx(rx,5)={[ks]};
 else   
    ks= k*(st^n)/(n+1);
resx(rx,2)={'Entered manually'};
resx(rx,3)={k};
resx(rx,4)={n};
    resx(rx,5)={[ks]};
 end
%% force and inital height
  switch a
    case 2
        dp=d0;
        st=log((d0^2)/(d1^2));
         %efficiency    
       if st <.4
          efficiency=55;
       elseif st <1
           efficiency=60;
       elseif st <1.6
           efficiency=65;
       else
           efficiency=70; 
       end
       %initial hieght
        h0=(pi/4*((d0^2)*h1+(d1^2)*h2))/(pi/4*(d0^2));
        %force
        f=((pi/4*(dp^2))*ks*st*100/efficiency);
     axes(handles.axes15);
     imshow('rodex.png');
  resx(rx,6)={[d0]};
  resx(rx,7)={[d1]};
  resx(rx,10)={[h1]};
  resx(rx,12)={[h2]};
    case 3
           d0=str2double(get(handles.Ulw,'string'));
           d1=str2double(get(handles.Uuw,'string'));
           h1=str2double(get(handles.Uuh,'string'));
           h2=str2double(get(handles.Ulh,'string'));
           dp=d1;
          
           h0=(pi/4*((d0^2)*h2+((d0^2)-(d1^2))*h1))/(pi/4*(d0^2));
           s=(d0-d1)/2;
           %strain
           if(d0/s)<=10  
           st=log((dp^2)/(d0^2-d1^2));
           else
               st=log(d0/(d0-dp))-.16; 
          end
           %efficiency
          if st <.4
          efficiency=52;
       elseif st <1.2
           efficiency=55;
       elseif st <1.8
           efficiency=56;
       else
           efficiency=58;
          end
          %force
           if(d0/s)<=10  
            f=((pi/4*(dp^2))*ks*st*100/efficiency);
           else
               f=((pi/4*(dp^2))*ks*100/efficiency)*(2+.25*h1/s);
           end
     axes(handles.axes15);
     imshow('canex.png');
  resx(rx,6)={[d0]};
  resx(rx,8)={[d1]};
  resx(rx,10)={[h1]};
  resx(rx,12)={[h2]};
     case 4
           d0=str2double(get(handles.Huw,'string'));
           d1=str2double(get(handles.Huw2,'string'));
           d2=str2double(get(handles.Hlw,'string'));
           h1=str2double(get(handles.Huh,'string'));
           h2=str2double(get(handles.Hlh,'string'));
           h3=str2double(get(handles.Hmh,'string'));
           dp=d1;
           efficiency=70; 
           s=(d0-d1)/2;
           h0=((d0^2)*h3+((d0^2)-(d1^2))*h1+(((d0^2)-(d2^2))*h2))/(d0^2);;
            
           %strain and force backword 
           if(d0/s)<=10    
           st1=log((d1^2)/((d0^2)-(d1^2)));
           
          if b==1
knm=xlsread('K-values.xlsx');
exk={'Al 99.8'; 'AlMgSi 1' ; 'CuZn 37 (Ms 63)' ; '42 CrMo 4' ; '15 CrNi 6' ; 'Ma 8' ; 'Ck 10' ; 'Ck 15 / Cq 15' ; 'Cq 22' ; 'Cq 35' ; 'Ck 45 / Cq 45' ; '16 MnCr 5'};
resx(rx,2)=exk(i,1);
resx(rx,3)={[knm(i,1)]};
resx(rx,4)={[knm(i,2)]};
    ks1= mat(i,1);
    
   if st1<=.1
     ks2=mat(i,2);
   elseif st1<=.2
      ks2=mat(i,3);
   elseif st1<=.4
     ks2=mat(i,4);
   elseif st1<=.6
      ks2=mat(i,5);
   elseif st1<=.8
       ks2=mat(i,6);
   elseif st1<=1
      ks2=mat(i,7);
   elseif st1<=1.2
     ks2=mat(i,8);
   elseif st1<=1.4
      ks2=mat(i,9);
   else
      ks2=mat(i,10);
   end
    ks=(ks1+ks2)/2;  
resx(rx,5)={[ks]};
 else   
    ks= k*(st1^n)/(n+1);
resx(rx,2)={'Entered manually'};
resx(rx,3)={k};
resx(rx,4)={n};
    resx(rx,5)={[ks]};
 end
            f1=((pi/4*(dp^2))*ks*st1*100/efficiency);
           else
               st1=log(d0/(d0-dp))-.16;
                         
          if b==1
knm=xlsread('K-values.xlsx');
exk={'Al 99.8'; 'AlMgSi 1' ; 'CuZn 37 (Ms 63)' ; '42 CrMo 4' ; '15 CrNi 6' ; 'Ma 8' ; 'Ck 10' ; 'Ck 15 / Cq 15' ; 'Cq 22' ; 'Cq 35' ; 'Ck 45 / Cq 45' ; '16 MnCr 5'};
resx(rx,2)=exk(i,1);
resx(rx,3)={[knm(i,1)]};
resx(rx,4)={[knm(i,2)]};
    ks1= mat(i,1);
    
   if st1<=.1
     ks2=mat(i,2);
   elseif st1<=.2
      ks2=mat(i,3);
   elseif st1<=.4
     ks2=mat(i,4);
   elseif st1<=.6
      ks2=mat(i,5);
   elseif st1<=.8
       ks2=mat(i,6);
   elseif st1<=1
      ks2=mat(i,7);
   elseif st1<=1.2
     ks2=mat(i,8);
   elseif st1<=1.4
      ks2=mat(i,9);
   else
      ks2=mat(i,10);
   end
    ks=(ks1+ks2)/2;  
resx(rx,5)={[ks]};
 else   
    ks= k*(st1^n)/(n+1);
resx(rx,2)={'Entered manually'};
resx(rx,3)={k};
resx(rx,4)={n};
    resx(rx,5)={[ks]};
 end
               f1=((pi/4*(dp^2))*ks*100/efficiency)*(2+.25*h0/s);
           end
           %strain and force forward
            dp1=d2;
        st2=log((d0^2)/((d0^2)-(d1^2)));
           
          if b==1
knm=xlsread('K-values.xlsx');
exk={'Al 99.8'; 'AlMgSi 1' ; 'CuZn 37 (Ms 63)' ; '42 CrMo 4' ; '15 CrNi 6' ; 'Ma 8' ; 'Ck 10' ; 'Ck 15 / Cq 15' ; 'Cq 22' ; 'Cq 35' ; 'Ck 45 / Cq 45' ; '16 MnCr 5'};
resx(rx,2)=exk(i,1);
resx(rx,3)={[knm(i,1)]};
resx(rx,4)={[knm(i,2)]};
    ks1= mat(i,1);
    
   if st2<=.1
     ks2=mat(i,2);
   elseif st2<=.2
      ks2=mat(i,3);
   elseif st2<=.4
     ks2=mat(i,4);
   elseif st2<=.6
      ks2=mat(i,5);
   elseif st2<=.8
       ks2=mat(i,6);
   elseif st2<=1
      ks2=mat(i,7);
   elseif st2<=1.2
     ks2=mat(i,8);
   elseif st2<=1.4
      ks2=mat(i,9);
   else
      ks2=mat(i,10);
   end
    ks=(ks1+ks2)/2;  
resx(rx,5)={[ks]};
 else   
    ks= k*(st2^n)/(n+1);
resx(rx,2)={'Entered manually'};
resx(rx,3)={k};
resx(rx,4)={n};
    resx(rx,5)={[ks]};
 end
        f2=((pi/4*(dp1^2))*ks*st2*100/efficiency);
        %needed force
           if f1>=f2
             f=f1;
          
           else
               f=f2;
              
           end
     axes(handles.axes15);
     imshow('can-canex.png');
  resx(rx,6)={[d0]};
  resx(rx,8)={[d1]};
  resx(rx,9)={[d2]};
  resx(rx,10)={[h1]};
  resx(rx,11)={[h3]};
  resx(rx,12)={[h2]};
  end         
  ft=f/(9.81*1000);
set(handles.resg,'visible','on');
set(handles.f,'string',f);
set(handles.ft,'string',ft);
set(handles.h,'string',h0);
 resx(rx,13)={[f]};
 resx(rx,14)={[ft]};
 resx(rx,15)={[h0]};
global input  d1ul d1ll d1ul1 d1ll1 d1ul2 d1ll2
switch a
    case 2
        if (input>d1ul)|(input<d1ll)
            set(handles.resg,'visible','off');
            resx(rx,16)={'refused'};
        end
    case 3
        if (input>d1ul)|(input<d1ll)
            set(handles.resg,'visible','off');
            resx(rx,16)={'refused'};
        end
    case 4
        if (input>d1ul1)|(input<d1ll1)
            set(handles.resg,'visible','off');
            resx(rx,16)={'refused'};
        end
        if (input>d1ul2)|(input<d1ll2)
            set(handles.resg,'visible','off');
            resx(rx,16)={'refused'};
        end
end
rx=rx+1;
     

function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ulh_Callback(hObject, eventdata, handles)
% hObject    handle to Ulh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ulh as text
%        str2double(get(hObject,'String')) returns contents of Ulh as a double


% --- Executes during object creation, after setting all properties.
function Ulh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ulh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Uuw_Callback(hObject, eventdata, handles)
% hObject    handle to Uuw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global d1ul d1ll resx rx
input=str2double(get(handles.Uuw,'string'));
if (input>d1ul)|(input<d1ll)
    sound(sin(1:3000));
    set(handles.wr1,'string','Unacceptable value Please check the range limits')
    set(handles.wrg,'visible','on');
    set(handles.Uuh,'enable','off');
    set(handles.Ulh,'enable','off');
    set(handles.Ulw,'enable','off');
    set(handles.Uuw,'foregroundcolor','red');
    set(handles.solve,'enable','off');

else
    set(handles.wrg,'visible','off');
    set(handles.Uuh,'enable','on');
    set(handles.Ulh,'enable','on');
    set(handles.Ulw,'enable','on');
    set(handles.Uuw,'foregroundcolor','black');
    set(handles.solve,'enable','on');
end
% Hints: get(hObject,'String') returns contents of Uuw as text
%        str2double(get(hObject,'String')) returns contents of Uuw as a double


% --- Executes during object creation, after setting all properties.
function Uuw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Uuw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Uuh_Callback(hObject, eventdata, handles)
% hObject    handle to Uuh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Uuh as text
%        str2double(get(hObject,'String')) returns contents of Uuh as a double


% --- Executes during object creation, after setting all properties.
function Uuh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Uuh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ulw_Callback(hObject, eventdata, handles)
% hObject    handle to Ulw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global d0ul d0ll
input=str2double(get(handles.Ulw,'string'));
if (input>d0ul)|(input<d0ll)
    sound(sin(1:3000));
    set(handles.wr1,'string','Unacceptable value Please observe the rang limits')
    set(handles.wrg,'visible','on');
    set(handles.Uuh,'enable','off');
    set(handles.Ulh,'enable','off');
    set(handles.Uuw,'enable','off');
    set(handles.Ulw,'foregroundcolor','red');
else
    set(handles.wrg,'visible','off');
    set(handles.Uuh,'enable','on');
    set(handles.Ulh,'enable','on');
    set(handles.Uuw,'enable','on');
    set(handles.Ulw,'foregroundcolor','black');
end
% Hints: get(hObject,'String') returns contents of Ulw as text
%        str2double(get(hObject,'String')) returns contents of Ulw as a double


% --- Executes during object creation, after setting all properties.
function Ulw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ulw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on Uuw and none of its controls.
function Uuw_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Uuw (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(ft) that was pressed
%	Modifier: name(ft) of the modifier key(ft) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global d1ul d1ll d0ul d0ll d0 stpb
d0ul=80; d0ll=0.5; d0=str2double(get(handles.Ulw,'string'));
         d1ul=d0*sqrt(exp(stpb)/(exp(stpb)+1));
         d1ll=d0/sqrt(2);
set(handles.Uuwg,'visible','on')
set(handles.Ulwg,'visible','off')
 set(handles.Uuwt1,'string',d1ll)
set(handles.Uuwt3,'string',d1ul)


% --- Executes on key press with focus on Ulw and none of its controls.
function Ulw_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Ulw (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(ft) that was pressed
%	Modifier: name(ft) of the modifier key(ft) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global d0ul d0ll
d0ul=80; d0ll=0.5; 
set(handles.Uuwg,'visible','off')
set(handles.Ulwg,'visible','on')
set(handles.Ulwt1,'string',d0ll)
set(handles.Ulwt3,'string',d0ul)



function Hlh_Callback(hObject, eventdata, handles)
% hObject    handle to Hlh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Hlh as text
%        str2double(get(hObject,'String')) returns contents of Hlh as a double


% --- Executes during object creation, after setting all properties.
function Hlh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Hlh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Huw_Callback(hObject, eventdata, handles)
% hObject    handle to Huw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global d0ul d0ll
input=str2double(get(handles.Huw,'string'));
if (input>d0ul)|(input<d0ll)
    sound(sin(1:3000));
    set(handles.wr1,'string','Unacceptable values Please observe the rang limits')
    set(handles.wrg,'visible','on');
    set(handles.Huw2,'enable','off');
    set(handles.Huh,'enable','off');
    set(handles.Hmh,'enable','off');
    set(handles.Hlh,'enable','off');
    set(handles.Hlw,'enable','off');
    set(handles.Huw,'foregroundcolor','red');
else
    set(handles.wrg,'visible','off');
    set(handles.Huw2,'enable','on');
    set(handles.Huh,'enable','on');
    set(handles.Hmh,'enable','on');
    set(handles.Hlh,'enable','on');
    set(handles.Hlw,'enable','on');
    set(handles.Huw,'foregroundcolor','black');
end

% Hints: get(hObject,'String') returns contents of Huw as text
%        str2double(get(hObject,'String')) returns contents of Huw as a double


% --- Executes during object creation, after setting all properties.
function Huw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Huw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Hmh_Callback(hObject, eventdata, handles)
% hObject    handle to Hmh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Hmh as text
%        str2double(get(hObject,'String')) returns contents of Hmh as a double


% --- Executes during object creation, after setting all properties.
function Hmh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Hmh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Hlw_Callback(hObject, eventdata, handles)
% hObject    handle to Hlw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global d1ul2 d1ll2 rx resx
input=str2double(get(handles.Hlw,'string'));
if (input>d1ul2)|(input<d1ll2)
    sound(sin(1:3000));
    set(handles.wr1,'string','Unacceptable values Please check the range limits')
    set(handles.wrg,'visible','on');
    set(handles.Huw,'enable','off');
    set(handles.Huh,'enable','off');
    set(handles.Hmh,'enable','off');
    set(handles.Hlh,'enable','off');
    set(handles.Huw2,'enable','off');
    set(handles.Hlw,'foregroundcolor','red');
    set(handles.solve,'enable','off');
   
else
    set(handles.wrg,'visible','off');
    set(handles.Huw,'enable','on');
    set(handles.Huh,'enable','on');
    set(handles.Hmh,'enable','on');
    set(handles.Hlh,'enable','on');
    set(handles.Huw2,'enable','on');
    set(handles.Hlw,'foregroundcolor','black');
    set(handles.solve,'enable','on');
end
% Hints: get(hObject,'String') returns contents of Hlw as text
%        str2double(get(hObject,'String')) returns contents of Hlw as a double


% --- Executes during object creation, after setting all properties.
function Hlw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Hlw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Huw2_Callback(hObject, eventdata, handles)
% hObject    handle to Huw2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global d1ul1 d1ll1 resx rx
input=str2double(get(handles.Huw2,'string'));
if (input>d1ul1)|(input<d1ll1)
    sound(sin(1:3000));
    set(handles.wr1,'string','Unacceptable values Please check the range limits')
    set(handles.wrg,'visible','on');
    set(handles.Huw,'enable','off');
    set(handles.Huh,'enable','off');
    set(handles.Hmh,'enable','off');
    set(handles.Hlh,'enable','off');
    set(handles.Hlw,'enable','off');
    set(handles.Huw2,'foregroundcolor','red');
    set(handles.solve,'enable','off');
    
else
    set(handles.wrg,'visible','off');
    set(handles.Huw,'enable','on');
    set(handles.Huh,'enable','on');
    set(handles.Hmh,'enable','on');
    set(handles.Hlh,'enable','on');
    set(handles.Hlw,'enable','on');
    set(handles.Huw2,'foregroundcolor','black');
    set(handles.solve,'enable','on');
end
% Hints: get(hObject,'String') returns contents of Huw2 as text
%        str2double(get(hObject,'String')) returns contents of Huw2 as a double


% --- Executes during object creation, after setting all properties.
function Huw2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Huw2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Huh_Callback(hObject, eventdata, handles)
% hObject    handle to Huh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Huh as text
%        str2double(get(hObject,'String')) returns contents of Huh as a double


% --- Executes during object creation, after setting all properties.
function Huh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Huh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on Huw and none of its controls.
function Huw_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Huw (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(ft) that was pressed
%	Modifier: name(ft) of the modifier key(ft) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global d0ul d0ll
d0ul=80; d0ll=0.5;
set(handles.Huwg,'visible','on')
set(handles.Hlwg,'visible','off')
set(handles.Huw2g,'visible','off')
 set(handles.Huwt1,'string',d0ll)
set(handles.Huwt3,'string',d0ul)


% --- Executes on key press with focus on Huw2 and none of its controls.
function Huw2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Huw2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(ft) that was pressed
%	Modifier: name(ft) of the modifier key(ft) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global d1ul1 d1ll1 d0 stpb
set(handles.Huwg,'visible','off')
set(handles.Hlwg,'visible','off')
set(handles.Huw2g,'visible','on')
d0=str2double(get(handles.Huw,'string'));

d1ul1=d0*sqrt(exp(stpb)/(exp(stpb)+1));         d1ll1=d0/sqrt(2);
set(handles.Huw2t1,'string',d1ll1)
set(handles.Huw2t3,'string',d1ul1)

% --- Executes on key press with focus on Hlw and none of its controls.
function Hlw_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Hlw (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(ft) that was pressed
%	Modifier: name(ft) of the modifier key(ft) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global d1ul2 d1ll2 d0 stpf
set(handles.Huwg,'visible','off')
set(handles.Hlwg,'visible','on')
set(handles.Huw2g,'visible','off')
d0=str2double(get(handles.Huw,'string'));
d1ul2=d0-1;      d1ll2=d0/exp(stpf);
set(handles.Hlwt1,'string',d1ll2)
set(handles.Hlwt3,'string',d1ul2)


% --- Executes on key press with focus on formsel and none of its controls.
function formsel_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to formsel (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(ft) that was pressed
%	Modifier: name(ft) of the modifier key(ft) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on ne and none of its controls.
function ne_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ne (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(handles.gg,'visible','off')


% --- Executes on button press in undo.
function undo_Callback(hObject, eventdata, handles)
% hObject    handle to undo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.resg,'visible','off');


% --- Executes on button press in exel.
function exel_Callback(hObject, eventdata, handles)
% hObject    handle to exel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global resx
xlswrite('Results.xlsx',resx)
winopen('Results.xlsx')
