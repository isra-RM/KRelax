function renamedicoms( inputfolder)
%this function recursively search dicoms files within inputfolder
% and rename them according to their headers
files = dir(inputfolder);%number of files within folder
files(1:2)=[];%remove. and ..
nfiles=size(files,1);%number of files
for i=1:nfiles
    if files(i).isdir
        renamedicoms( [inputfolder '\' files(i).name]);
    else
        cd(inputfolder);
        filename = files(i).name; %get file name
        filepath = [inputfolder '\' filename]; %get file path
        try
            info = dicominfo(filepath);
            echotime=info.EchoTime;
            reptime=info.RepetitionTime;
            numimage = info.InstanceNumber;
            serieimage = info.SeriesNumber;
            labelserie = getlabel(serieimage);
            labelnum = getlabel(numimage);
            labelmodality = info.Modality;
            study = info.StudyTime;
            labelstudy = getlabel(study);
            if isfield(info,'InversionTime')
                invtime=info.InversionTime;
                newname=[labelmodality '-' labelstudy num2str(study) '-' labelserie num2str(serieimage) '-' labelnum num2str(numimage) '-' ['TI-' num2str(invtime)] '-' ['TR-' num2str(reptime)] '-' ['TE-' num2str(echotime)]];              
            else
                newname=[labelmodality '-' labelstudy num2str(study) '-' labelserie num2str(serieimage) '-' labelnum num2str(numimage) '-' ['TR-' num2str(reptime)] '-' ['TE-' num2str(echotime)]];               
            end
            movefile(filename,newname);
            disp([filename ' renamed as ' newname ' - serie ' num2str(serieimage)]);
        catch err
            if (strcmp(err.identifier,'images:dicominfo:notDICOM'))
                disp([filename ' is not a DICOM image']);
            end
        end                             
    end
    cd('../');
end