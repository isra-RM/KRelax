function n = countdicoms( inputfolder )
%this function count dicoms files within inputfolder
% and return the number of dicom files
files = dir(inputfolder);%number of files within folder
files(1:2)=[];%remove. and ..
nfiles=size(files,1);%number of files
n=nfiles;%initialize dicom counter
for i=1:nfiles  
    filename = files(i).name; %get file name
    filepath = [inputfolder '\' filename]; %get file path
    try
        dicominfo(filepath);%read dicom header
        disp([num2str(i) ' DICOM file found']);
    catch err
        if (strcmp(err.identifier,'images:dicominfo:notDICOM'))
            disp([filename ' is not a DICOM image']);
            n=n-1;
        end        
    end    
end

end

