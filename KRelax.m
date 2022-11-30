function varargout = KRelax(varargin)
% KRelax MATLAB code for KRelax.fig
%      KRelax, by itself, creates a new KRelax or raises the existing
%      singleton*.
%
%      H = KRelax returns the handle to a new KRelax or the handle to
%      the existing singleton*.
%
%      KRelax('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KRelax.M with the given input arguments.
%
%      KRelax('Property','Value',...) creates a new KRelax or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the KRelax before KRelax_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to KRelax_OpeningFcn via varargin.
%
%      *See KRelax Options on GUIDE's Tools menu.  Choose "KRelax allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help KRelax

% Last Modified by GUIDE v2.5 06-Mar-2019 11:38:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @KRelax_OpeningFcn, ...
                   'gui_OutputFcn',  @KRelax_OutputFcn, ...
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


% --- Executes just before KRelax is made visible.
function KRelax_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to KRelax (see VARARGIN)

% Choose default command line output for KRelax
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes KRelax wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = KRelax_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%%%%%%%%%%%%%%%MENU%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function Protocol_Callback(hObject, eventdata, handles)
% hObject    handle to Protocol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function Rename_Callback(hObject, eventdata, handles)
% hObject    handle to Rename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%verificar la cantidad de carpetas
ImageDir=uigetdir(pwd,'Seleccionar la carpeta del protocolo a renombrar');
if ImageDir~=0
    renamedicoms(ImageDir);
end
%     Archivos=dir(ImageDir);
%     quitar los . y ..
%     Archivos(1:2)=[];
%     ver ctos carpetas hay
%     for k=1:length(Archivos)
%         h(k)=Archivos(k).isdir;
%     end
%     si no hay una carpetas ejecutar directamente la funcion dicomrename
%     if all(h==0)     
%         dicomrename(ImageDir);
%     si hay carpetas ejecutar renameprotocol
%     else    
%         renameprotocol(ImageDir);
%     end


% --------------------------------------------------------------------
function Move_Auto_Callback(hObject, eventdata, handles)
% hObject    handle to Move_Auto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------

function Slice1_Callback(hObject, eventdata, handles)
% hObject    handle to Slice1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ImageDir=uigetdir(pwd,'Select the folder with renamed images');

if ImageDir~=0
    defaultname='Slices';
    mkdir(ImageDir,defaultname);
    folder=[ImageDir '\' defaultname];
    extractdicoms( ImageDir,1,folder );
    disp(['Selected slices has been copied to ' folder])
end
%moveprotocol(1);


% --------------------------------------------------------------------
function Slice2_Callback(hObject, eventdata, handles)
% hObject    handle to Slice2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ImageDir=uigetdir(pwd,'Select the folder with renamed images');
if ImageDir~=0
    defaultname='Slices';
    mkdir(ImageDir,defaultname);
    folder=[ImageDir '\' defaultname];
    extractdicoms( ImageDir,2,folder );
    disp(['Selected slices has been copied to ' folder]);
end
%moveprotocol(2);


% --------------------------------------------------------------------
function Slice3_Callback(hObject, eventdata, handles)
% hObject    handle to Slice3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ImageDir=uigetdir(pwd,'Select the folder with renamed images');
if ImageDir~=0
    defaultname='Slices';
    mkdir(ImageDir,defaultname);
    folder=[ImageDir '\' defaultname];
    extractdicoms( ImageDir,3,folder );
    disp(['Selected slices has been copied to ' folder])  
end
%moveprotocol(3);


% --------------------------------------------------------------------
function Move_Manual_Callback(hObject, eventdata, handles)
% hObject    handle to Move_Manual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------
function Slice4_Callback(hObject, eventdata, handles)
% hObject    handle to Slice4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ImageDir=uigetdir(pwd,'Select the folder with renamed images');
targetDir=uigetdir(pwd,'Select the folder to put images in');
if ImageDir~=0 && targetDir~=0
   extractdicoms( ImageDir,1,targetDir );
    disp(['Selected slices has been copied to ' targetDir]) 
end
%moveprotocol(1,'s');


% --------------------------------------------------------------------
function Slice5_Callback(hObject, eventdata, handles)
% hObject    handle to Slice5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ImageDir=uigetdir(pwd,'Select the folder with renamed images');
targetDir=uigetdir(pwd,'Select the folder to put images in');
if ImageDir~=0 && targetDir~=0
   extractdicoms( ImageDir,2,targetDir );
   disp(['Selected slices has been copied to ' targetDir]) 
end
%moveprotocol(2,'s');


% --------------------------------------------------------------------
function Slice6_Callback(hObject, eventdata, handles)
% hObject    handle to Slice6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ImageDir=uigetdir(pwd,'Select the folder with renamed images');
targetDir=uigetdir(pwd,'Select the folder to put images in');
if ImageDir~=0 && targetDir~=0
   extractdicoms( ImageDir,3,targetDir );
    disp(['Selected slices has been copied to ' targetDir]) 
end
%moveprotocol(3,'s');

% --- Executes during object creation, after setting all properties.
function Open_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
handles.flag=0;
guidata(hObject,handles);

% --------------------------------------------------------------------
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Seleccionar de donde extraer las imagenes
ImageFolder=uigetdir(pwd,'Choose file with selected slices');

if ImageFolder~=0
   [I,cimg]=loaddicoms(ImageFolder);
   handles.flag=handles.flag+1;
   if handles.flag>1
       %si vuelve a cargar otras imagenes que se limpien
       %los axes
       cla(handles.ImagesAx,'reset');
       cla(handles.VialAx,'reset');
       %la tabla
       set(handles.TimeDataTab,'Data',cell(4,5));
       set(handles.TimeDataTab,'Enable','off');
       %el label de tipo de medicion
       set(handles.TMeasureSText,'String','---');
       % el listbox
       set(handles.ImagesListB,'String','Listbox');
       %desactivar todos los sliders y botones
       set(handles.ImagesSld,'Enable','off');
       set(handles.VialSld,'Enable','off');
       set(handles.Tools,'Enable','off');
       set(handles.VRegions,'Enable','off');
       set(handles.VSignals,'Enable','off');
       set(handles.DrawCircles,'Enable','off');
       set(handles.CalRegions,'Enable','off');
       set(handles.CalTs,'Enable','off');
       set(handles.CalRelax,'Enable','off');
       set(handles.RBManual,'Enable','off');
       set(handles.RBAutomatic,'Enable','off');
       set(handles.RBAutoGlobal,'Enable','off');
       % los label de total de imagenes e imagen actual
       set(handles.ImagesEText1,'String','');
       set(handles.ImagesEText2,'String','');
   end
   
   %se determina el tipo de medicion
   T=MType(cimg);
   
   if strcmp(T,'T1-SE')
       set(handles.TMeasureSText,'String',T);
   elseif strcmp(T,'T2-SE')
       set(handles.TMeasureSText,'String',T);
   elseif strcmp(T,'T1-IR')
       set(handles.TMeasureSText,'String',T);
   elseif strcmp(T,'T1-GE')
       set(handles.TMeasureSText,'String',T);
   else
       errordlg('Cannot measure');
   end
   %se reeescala si es inversion recovery
   if strcmp(T,'T1-IR')
       for i=1:length(cimg);
           I{i}=cimg{i}.RescaleSlope.*I{i}+cimg{i}.RescaleIntercept;
       end
   end
   % se ordena el arreglo de imagenes para mostrarlo en orden creciente en el
   % axes
   [I,cimg]=OrderImag(I,cimg,T);
   handles.I=I;
   handles.Imag=length(cimg);
   handles.cimg=cimg;
   %se colocan en las cajas de texto el total de imagenes y la imagen actual
   set(handles.ImagesEText1,'String',num2str(handles.Imag));
   set(handles.ImagesEText2,'String','1');
   %se activa el slider de las imagenes
   set(handles.ImagesSld,'Enable','on');
   %se establecen los valores maximos y minimos del slider
   maxsld1=str2double(get(handles.ImagesEText1,'String'));
   minsld1=1;
   set(handles.ImagesSld,'Max',maxsld1);   % Valor maximo del slider
   set(handles.ImagesSld,'Min',minsld1);   % Valor minimo del slider
   %se establece el paso del slider
   set(handles.ImagesSld,'SliderStep',[1,1]/(maxsld1-minsld1));  % establece el paso
   %se establece el valor del slider a 1
   set(handles.ImagesSld,'Value',minsld1);
   % se muestran los datos de la imagen en el listbox1
   dicom=InfoHDicom(handles.cimg{minsld1},T);
   set(handles.ImagesListB,'String',dicom);
   %se grafica la imagen
   axes(handles.ImagesAx);
   imagesc(handles.I{minsld1});
   colormap gray;
   datacursormode on;
   %se activa el boton de tools
   set(handles.Tools,'Enable','on');
   %se activa el boton de rotar imagenes
   set(handles.Rotate,'Enable','on');
   %se activa el boton de borrar imagenes
   set(handles.Delete,'Enable','on');
   %se activa el boton de FFT
   set(handles.FFT,'Enable','on');
   %se activa el boton de Contraste
   set(handles.Contrast,'Enable','on');
   %se activan los radiobuttons
   set(handles.RBManual,'Enable','on');
   set(handles.RBAutomatic,'Enable','on');
   set(handles.RBAutoGlobal,'Enable','on');
   set(handles.RBManual,'Value',0);
   set(handles.RBAutomatic,'Value',1);
   set(handles.RBAutoGlobal,'Value',0);
   %se activa el boton de calcular regions si esta activado automatico
   IsAuto=get(handles.RBAutomatic,'Value');
   IsAutoG=get(handles.RBAutoGlobal,'Value');
   if IsAuto || IsAutoG 
       set(handles.CalRegions,'Enable','on');
   end
   %salvar data
   guidata(hObject,handles); 
   cd ../;
end

% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close KRelax;

% --------------------------------------------------------------------
function Tools_Callback(hObject, eventdata, handles)
% hObject    handle to Tools (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in RotateBtn.
function Rotate_Callback(hObject, eventdata, handles)
% hObject    handle to RotateBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nimagen=round(get(handles.ImagesSld,'Value'));
for k=1:length(handles.I)
    handles.I{k}=rot90(handles.I{k});
end
imagesc(handles.I{nimagen});
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function Rotate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RotateBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');

% --------------------------------------------------------------------
function Delete_Callback(hObject, eventdata, handles)
% hObject    handle to Delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice = questdlg('Are you sure to delete this image?', ...
	'Image Deletion', ...
	'Yes','No','No');
% Handle response
switch choice
    case 'Yes'
        T=get(handles.TMeasureSText,'String');
        nimagen=round(get(handles.ImagesSld,'Value'));
        handles.I(nimagen)=[];
        handles.cimg(nimagen)=[];
        handles.Imag=length(handles.cimg);
        %se actualiza en las cajas de texto el total de imagenes y la imagen actual
        set(handles.ImagesEText1,'String',num2str(handles.Imag));
        set(handles.ImagesEText2,'String','1');
        %se establecen los valores maximos y minimos del slider
        maxsld1=str2double(get(handles.ImagesEText1,'String'));
        minsld1=1;
        set(handles.ImagesSld,'Max',maxsld1);   % Valor maximo del slider
        set(handles.ImagesSld,'Min',minsld1);   % Valor minimo del slider
        %se establece el paso del slider
        set(handles.ImagesSld,'SliderStep',[1,1]/(maxsld1-minsld1));  % establece el paso
        %se establece el valor del slider a 1
        set(handles.ImagesSld,'Value',minsld1);
        % se muestran los datos de la imagen en el listbox1
        dicom=InfoHDicom(handles.cimg{minsld1},T);
        set(handles.ImagesListB,'String',dicom);
        %se grafica la imagen
        axes(handles.ImagesAx);
        imagesc(handles.I{minsld1});
        colormap gray;
        guidata(hObject,handles);
    case 'No'
end


function Delete_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RotateBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');


% --------------------------------------------------------------------
function FFT_Callback(hObject, eventdata, handles)
% hObject    handle to FFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nimagen=round(get(handles.ImagesSld,'Value'));
Imagen=handles.I{nimagen};
FT=fftshift(fft2(Imagen));
AFT=abs(FT);
figure('Name', ['Fourier Transform for image ' num2str(nimagen)]);
imagesc(log(AFT));
colormap gray;


% --- Executes during object creation, after setting all properties.
function FFT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RotateBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');



% --------------------------------------------------------------------
function Contrast_Callback(hObject, eventdata, handles)
% hObject    handle to Contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nimagen=round(get(handles.ImagesSld,'Value'));
imtool(handles.I{nimagen},[0 max(max(handles.I{nimagen}))]);


% --- Executes during object creation, after setting all properties.
function Contrast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RotateBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');





%% GUI COMPONENTS


%%%%%%%%%BUTTONS%%%%%%%%%%%%%


% --- Executes on button press in DrawCircles.
function DrawCircles_Callback(hObject, eventdata, handles)
% hObject    handle to DrawCircles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% se pide seleccion de una ROI en el phantom
T=get(handles.TMeasureSText,'String');
m1=msgbox('Press Enter to finish selection or Delete to remove previous one','Selection Guideline','help','modal');
set(m1,'Position',[350 350 285 75]);
[x, y] = getpts(handles.ImagesAx);
handles.centers=round(OrdCent([x,y]));
radii=str2double(get(handles.ETextRadius,'String'));
handles.vradii=radii*ones(size(handles.centers,1),1);
viscircles(handles.ImagesAx,handles.centers,handles.vradii,'EdgeColor','r');
%se muestran en la tabla los centros
set(handles.TimeDataTab,'Enable','on');
colnames={'Tag','Xc','Yc',[T(1:2) ' (ms)'],'Conc (mmol/L)'};
set(handles.TimeDataTab,'ColumnName',colnames);
set(handles.TimeDataTab,'Data',[[1:size(handles.centers,1)]',round(handles.centers),zeros(size(handles.centers,1),1),zeros(size(handles.centers,1),1)]);
%se activa el boton de calcular regiones en imagenes
set(handles.CalRegions,'Enable','on');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function DrawCircles_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DrawCircles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');



% --- Executes on button press in CalRegions.
function CalRegions_Callback(hObject, eventdata, handles)
% hObject    handle to CalRegions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% camino para salvar el fichero de los datos de las regiones sin filtrar
[name, path,filter]=uiputfile({'*.txt'},'Select location to save raw data extracted from vials',['Data-',handles.cimg{1}.PatientID]);
if filter~=0
    %se obtienen los valores de los radiobuttons
    IsManual=get(handles.RBManual,'Value');
    IsAutomatic=get(handles.RBAutomatic,'Value');
    IsAutoGlobal=get(handles.RBAutoGlobal,'Value');
    % se le asigna a T el valor del string del static text correspondiente
    T=get(handles.TMeasureSText,'String');
    ficheroCamino=[path name];
    if IsManual
    %calcular medias por centroide y guardarlos en un fichero de texto
    handles.DatosRegions=ExtRegions(handles.I,handles.cimg,handles.centers,handles.vradii,ficheroCamino,T);      
    elseif IsAutomatic
        %calcular medias por centroide y guardarlos en un fichero de texto
        handles.DatosRegions=ExtRegionsAuto(handles.I,handles.cimg,ficheroCamino,T);
        %se corrigen los movimientos de los centroides
        bias=5;
        [handles.DatosRegions,handles.centers]=CorrCentAuto(handles.DatosRegions,bias,ficheroCamino,T);
        %se muestran en la tabla los centros
        set(handles.TimeDataTab,'Enable','on');
        colnames={'Tag','Xc','Yc',[T(1:2) ' (ms)'],'Conc (mmol/L)'};
        set(handles.TimeDataTab,'ColumnName',colnames);
        set(handles.TimeDataTab,'Data',[[1:size(handles.centers,1)]',round(handles.centers),zeros(size(handles.centers,1),1),zeros(size(handles.centers,1),1)]);
    elseif IsAutoGlobal
        % dialogo para entrar el numero de la imagen seleccionada como mascara
        nimagen=inputdlg('Enter image number to be used as mask','Mask Selection',[1,length('Mask Selection')+10]);
        if ~isempty(nimagen)
            nimagen=str2double(nimagen);
            %calcular medias por centroide y guardarlos en un fichero de texto
            [handles.DatosRegions,handles.centers]=ExtRegionsAutoGlob(handles.I,handles.cimg,handles.I{nimagen},handles.cimg{nimagen},ficheroCamino,T);
            %se muestran en la tabla los centros
            set(handles.TimeDataTab,'Enable','on');
            colnames={'Tag','Xc','Yc',[T(1:2) ' (ms)'],'Conc (mmol/L)'};
            set(handles.TimeDataTab,'ColumnName',colnames);
            set(handles.TimeDataTab,'Data',[[1:size(handles.centers,1)]',round(handles.centers),zeros(size(handles.centers,1),1),zeros(size(handles.centers,1),1)]);           
        end
    end
    %extraer intensidades , tiempos,desv standard y coord de cada centroide (vial)
    [handles.Int,handles.Tiempos,handles.DS]=ExtCentInt(handles.DatosRegions,handles.centers,T);
    %se activa el boton CalcT
    set(handles.CalTs,'Enable','on');
    %se activa el boton ViewRegions
    set(handles.VRegions,'Enable','on');
    set(handles.VSignals,'Enable','on');
    %se activa el slider2
    set(handles.VialSld,'Enable','on');
    %se establecen los valores maximos y minimos del slider2
    max2=size(handles.Int,2);
    min2=1;
    if max2==1
        set(handles.VialSld,'Visible','off');
    else
        set(handles.VialSld,'Max',max2);   % Valor maximo del slider2
        set(handles.VialSld,'Min',min2);   % Valor minimo del slider2
        %se establece el paso del slider2
        set(handles.VialSld,'SliderStep',[1,1]/(max2-min2));  % establece el paso
        %se establece el valor del slider2 a 1
        set(handles.VialSld,'Value',min2);
    end
    %se grafica el vial en el axes2
    axes(handles.VialAx);
    errorbar(handles.Tiempos{min2},handles.Int{min2},handles.DS{min2},'o-');
    grid on
    title(['Vial ' num2str(min2) ' Signal plot']);
    if strcmp(T,'T1-SE')
        xlabel('Repetition Time (ms)');
    elseif strcmp(T,'T2-SE')
        xlabel('Echo Time (ms)');
    elseif strcmp(T,'T1-IR')
        xlabel('Inversion Time (ms)');
    elseif strcmp(T,'T1-GE')
        xlabel('Flip Angle (dg)');
    end
    ylabel('Signal (RU)');
    %se grafica en el axes1 la posicion del vial
    axes(handles.ImagesAx);
    hold on
    handles.vial=plot(handles.centers(min2,1),handles.centers(min2,2),'or','MarkerFaceColor','r');
    handles.texto=text(handles.centers(min2,1),handles.centers(min2,2), ...
        sprintf('%2i %s %2i',handles.centers(min2,1),';',handles.centers(min2,2)), ...
        'EdgeColor','b','Color','k','BackgroundColor','w');
    hold off
    guidata(hObject,handles);
end

% --- Executes during object creation, after setting all properties.
function CalRegions_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CalRegions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');

% --- Executes on button press in VRegions.
function VRegions_Callback(hObject, eventdata, handles)
% hObject    handle to VRegions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nimagen=round(get(handles.ImagesSld,'Value'));
figure('Name',['Regions data from image ' num2str(nimagen)]);
imagesc(handles.I{nimagen});
colormap gray;
T=get(handles.TMeasureSText,'String');
if strcmp(T,'T1-SE')
    Tiempo=handles.cimg{nimagen}.RepetitionTime;
elseif strcmp(T,'T2-SE')
    Tiempo=handles.cimg{nimagen}.EchoTime;
elseif strcmp(T,'T1-IR')
    Tiempo=handles.cimg{nimagen}.InversionTime;
elseif strcmp(T,'T1-GE')
    Tiempo=handles.cimg{nimagen}.FlipAngle;
end

posT=find(handles.DatosRegions(:,1)==Tiempo);
Data=handles.DatosRegions(posT,:);
Cent=Data(:,2:3);
Mean=Data(:,4);
DS=Data(:,5);
% se grafica en la imagen seleccionada media y DS de cada vial detectado
for i=1:size(Cent,1);
hold on
plot(Cent(i,1),Cent(i,2),'or','MarkerFaceColor','r');
text(Cent(i,1),Cent(i,2), ...
    sprintf('%2.1f %s %2.1f',Mean(i),'+-',DS(i)), ...
    'EdgeColor','b','Color','k','BackgroundColor','w');
end
title('Statistical properties from vials detected (Mean+-SD)');
hold off


% --- Executes during object creation, after setting all properties.
function VRegions_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VRegions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');

% --- Executes on button press in VSignals.
function VSignals_Callback(hObject, eventdata, handles)
% hObject    handle to VSignals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotstyle={'b-o','r-x','g-s','c-d','k-<','r-o','g-x','c-s','k-d','b-<','g-o','c-x','k-s','b-d','r-<','c-o','k-x','b-s','r-d','g-<','k-o','b-x','r-s','g-d','c-<'};
nvials=length(handles.Int);
legendInfo=cell(length(handles.Int),1);
figure;
for i=1:nvials
    hold on
    errorbar(handles.Tiempos{i},handles.Int{i},handles.DS{i},plotstyle{i});
    legendInfo{i} = ['Vial ' num2str(i)]; 
end
hold off
T=get(handles.TMeasureSText,'String');
title('Graph of Signals');
grid on
if strcmp(T,'T1-SE')
    xlabel('Repetition Time (ms)');
elseif strcmp(T,'T2-SE')
    xlabel('Echo Time (ms)');
elseif strcmp(T,'T1-IR')
    xlabel('Inversion Time (ms)');
elseif strcmp(T,'T1-GE')
    xlabel('Flip Angle');
end
ylabel('Signals (RU)');
legend(legendInfo);


% --- Executes during object creation, after setting all properties.
function VSignals_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VSignals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');

% --- Executes on button press in CalTs.
function CalTs_Callback(hObject, eventdata, handles)
% hObject    handle to CalTs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% se le asigna a T el valor del string del static text correspondiente
T=get(handles.TMeasureSText,'String');
% camino para salvar el fichero de los  T1\T2 
[fname,fpath,filter1]=uiputfile({'*.txt'},['Select the location to save Mo and ' T(1:2)],['Calculation of-',T(1:2),' ',handles.cimg{1}.PatientID]);
if filter1~=0
    ficheroDir=[fpath fname];
    %calcular M0 y T1\T2 de cada centroide
    [handles.Tag,handles.Mag,handles.TRelaj]=CalcTRelax(handles.Int,handles.Tiempos,handles.centers,handles.cimg,T,ficheroDir);
    % mostrar en la tabla los datos
    set(handles.TimeDataTab,'Enable','on');
    handles.Conci=zeros(size(handles.Tag));
    set(handles.TimeDataTab,'Data',[handles.Tag,handles.centers,handles.TRelaj,handles.Conci]);
    %activar el boton de calcular relaxitividad
    set(handles.CalRelax,'Enable','on');
    guidata(hObject,handles);   
% camino para salvar el fichero de los  T1\T2 corregidos
% [fnamec,fpathc,filter2]=uiputfile({'*.txt'},['Select the location to save Mo and ' T ' corrected'],['Correction of-',T,' ',handles.cimg{1}.PatientID]);
% if filter2~=0
%     ficheroDirC=[fpathc fnamec];
%     %corregir los T1 - T2
%     [handles.TagC,handles.MagC,handles.TRelajC,handles.CentC]=CorrecT( handles.Cent,handles.Mag,handles.TRelaj,handles.cimg,T,ficheroDirC);    
% end
end

% --- Executes during object creation, after setting all properties.
function CalTs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CalTs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');

% --- Executes on button press in CalRelax.
function CalRelax_Callback(hObject, eventdata, handles)
% hObject    handle to CalRelax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Data=get(handles.TimeDataTab,'Data');
pos=find(Data(:,5));
Concf=Data(pos,5);
%verificar que  no haya entrado caracteres de texto 
if sum(isnan(Concf))==0 && sum(nnz(Concf))>=2 && ~any(Concf<0)
    R=1000./Data(pos,4);
    cftool(Concf,R);
elseif sum(Concf)==0
    warndlg('You cannot fit with empty data','Warning!');
else
    warndlg('You must insert valid data for calculation','Warning!');
end

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function CalRelax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CalRelax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');

%%%%%%%%%%SLIDERS%%%%%%%%%%


% --- Executes on slider movement.
function ImagesSld_Callback(hObject, eventdata, handles)
% hObject    handle to ImagesSld (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%se obtiene el valor del slider
nimagen = round(get(hObject,'Value') );
% se obtiene el tipo de medicion
T=get(handles.TMeasureSText,'String');
% se actualiza la imagen que se muestra en la caja de texto
set(handles.ImagesEText2,'String',num2str(nimagen));
% se muestran los datos de la imagen en el listbox1
dicom=InfoHDicom(handles.cimg{nimagen},T);
set(handles.ImagesListB,'String',dicom);
axes(handles.ImagesAx);
% se grafica la imagen actual
imagesc(handles.I{nimagen});
colormap gray;
%se plotean los circulos si se dibujaron
IsManual=get(handles.RBManual,'Value');
if isfield(handles,'centers')&& IsManual
   viscircles(handles.ImagesAx,handles.centers,handles.vradii,'EdgeColor','r');
end

%si el slider2 esta activo plotear los centroides arriba de las imagenes
state=get(handles.VialSld,'Enable');

if strcmp(state,'on')
    %se obtiene el vial correspondiente
    nvial=get(handles.VialSld,'Value');
    hold on
    handles.vial=plot(handles.centers(nvial,1),handles.centers(nvial,2),'or','MarkerFaceColor','r');
    handles.texto=text(handles.centers(nvial,1),handles.centers(nvial,2), ...
        sprintf('%2i %s %2i',handles.centers(nvial,1),';',handles.centers(nvial,2)), ...
        'EdgeColor','b','Color','k','BackgroundColor','w');
    hold off
end

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function ImagesSld_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImagesSld (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
    
end

% --- Executes on slider movement.
function VialSld_Callback(hObject, eventdata, handles)
% hObject    handle to VialSld (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
T=get(handles.TMeasureSText,'String');
%se obtiene el valor del slider
nvial = round(get(hObject,'Value') );
axes(handles.VialAx);
errorbar(handles.Tiempos{nvial},handles.Int{nvial},handles.DS{nvial},'o-');
grid on
title(['Vial ' num2str(nvial) ' Signal plot']);
%se nombra el eje x de acuerdo al tipo de medicion
if strcmp(T,'T1-SE')
    xlabel('Repetition Time(ms)');
elseif strcmp(T,'T2-SE')
    xlabel('Echo Time(ms)');
elseif strcmp(T,'T1-IR')
    xlabel('Inversion Time(ms)');
elseif strcmp(T,'T1-GE')
    xlabel('Flip Angle');
end
ylabel('Signal (RU)');
%se grafica en el axes1 la posicion del vial 
axes(handles.ImagesAx);
delete(handles.vial);
delete(handles.texto);
hold on
handles.vial=plot(handles.centers(nvial,1),handles.centers(nvial,2),'or','MarkerFaceColor','r');
handles.texto=text(handles.centers(nvial,1),handles.centers(nvial,2), ...
    sprintf('%2i %s %2i',handles.centers(nvial,1),';',handles.centers(nvial,2)), ...
    'EdgeColor','b','Color','k','BackgroundColor','w');
hold off
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function VialSld_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VialSld (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);   
end



%%%%%%%%%%%%TABLES%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function TimeDataTab_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TimeDataTab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
rownames=[];
coleditable=[false,false,false,false,true];
colnames={'Tag','Xc','Yc', 'T (ms)','Conc (mmol/L)'};
widths={'auto','auto','auto','auto','auto'};
set(hObject,'ColumnWidth',widths);
set(hObject,'RowName',rownames);
set(hObject,'ColumnName',colnames);
set(hObject,'ColumnEditable',coleditable);
set(hObject,'Enable','off');



%%%%%%%%%%%%%%%%%LISTBOX%%%%%%%%%%%%%%%%%


% --- Executes on selection change in ImagesListB.
function ImagesListB_Callback(hObject, eventdata, handles)
% hObject    handle to ImagesListB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function ImagesListB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImagesListB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



%%%%%%%%%%EDITTEXT%%%%%%%%%%%%%%%



function ImagesEText1_Callback(hObject, eventdata, handles)
% hObject    handle to ImagesEText1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function ImagesEText1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImagesEText1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ImagesEText2_Callback(hObject, eventdata, handles)
% hObject    handle to ImagesEText2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function ImagesEText2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImagesEText2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function ETextRadius_Callback(hObject, eventdata, handles)
% hObject    handle to ETextRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'centers')
    radii=str2double(get(hObject,'String'));
    handles.vradii=radii*ones(size(handles.centers,1),1);
    viscircles(handles.ImagesAx,handles.centers,handles.vradii,'EdgeColor','r');
    guidata(hObject,handles)
end

% --- Executes during object creation, after setting all properties.
function ETextRadius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ETextRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    set(hObject,'Enable','off');
end

%%%%%%%%%%%%RADIOBUTTONS%%%%%%%%%%%%%%%

% --- Executes on button press in RBAutomatic.
function RBAutomatic_Callback(hObject, eventdata, handles)
% hObject    handle to RBAutomatic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ETextRadius,'Enable','off');
set(handles.DrawCircles,'Enable','off');
set(handles.RBManual,'Value',0);
set(handles.RBAutoGlobal,'Value',0);
set(hObject,'Value',1);



% --- Executes on button press in RBManual.
function RBManual_Callback(hObject, eventdata, handles)
% hObject    handle to RBManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.ETextRadius,'Enable','on');
set(handles.DrawCircles,'Enable','on');
set(hObject,'Value',1);
set(handles.RBAutomatic,'Value',0);
set(handles.RBAutoGlobal,'Value',0);



% --- Executes during object creation, after setting all properties.
function RBAutomatic_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RBAutomatic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');


% --- Executes during object creation, after setting all properties.
function RBManual_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RBManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');


% --- Executes on button press in RBAutoGlobal.
function RBAutoGlobal_Callback(hObject, eventdata, handles)
% hObject    handle to RBAutoGlobal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ETextRadius,'Enable','off');
set(handles.DrawCircles,'Enable','off');
set(handles.RBManual,'Value',0);
set(handles.RBAutomatic,'Value',0);
set(hObject,'Value',1);

% --- Executes during object creation, after setting all properties.
function RBAutoGlobal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RBAutoGlobal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');
