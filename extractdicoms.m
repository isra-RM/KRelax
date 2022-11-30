function extractdicoms( inputfolder,numslice,outputfolder )
%this function recursively search dicoms files with slice number equals numslice within an inputfolder
% and copy them to an outputfolder 
files = dir(inputfolder);%number of files within folder
files(1:2)=[];%remove. and ..
nfiles=size(files,1);%number of files
for i=1:nfiles
    if files(i).isdir
        extractdicoms( [inputfolder '\' files(i).name],numslice,outputfolder );
    else
        cd(inputfolder);
        namefile = files(i).name; %get file name
        filepath = [inputfolder '\' namefile]; %get file path
        try %try to extract dicom header info
            info = dicominfo(filepath); %extract dicom header info
            numimage = info.InstanceNumber;
            if numimage==numslice
                copyfile(namefile,outputfolder);
            end
        catch err %otherwise disp an error
            if (strcmp(err.identifier,'images:dicominfo:notDICOM'))
                disp([namefile 'is not a DICOM image']);
            end
        end
    end
    cd('../')
end

