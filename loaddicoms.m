function [I,cimg]=loaddicoms( inputfolder)
%this function read dicoms files within inputfolder
% and return the array of images with their headers
files = dir(inputfolder);%number of files within folder
ndicoms=countdicoms(inputfolder);
files(1:2)=[];%remove. and ..
nfiles=size(files,1);%number of files
cimg=cell(ndicoms,1);%initialize header cell array
I=cell(ndicoms,1);%initialize image cell array
cd(inputfolder);
for i=1:nfiles  
    filename = files(i).name; %get file name
    filepath = [inputfolder '\' filename]; %get file path
    try
        info = dicominfo(filepath);%read dicom header
        image= dicomread(filepath);%read dicom image
        cimg{i}=info; % store header in array
        I{i}=double(image); %store in image array
        disp([filename ' read and stored '  ' - Image ' num2str(i)]);
    catch err
        if (strcmp(err.identifier,'images:dicominfo:notDICOM'))
            disp([filename ' is not a DICOM image']);         
        end        
    end    
end
cd('../');
end
