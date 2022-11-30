function info=InfoHDicom(cimg,T)


if strcmp(T,'T1-IR')
  info={%['Protocol Name: ' cimg.ProtocolName];
        %['Sequence Name: ' cimg.SequenceName];
        ['TR: ' num2str(cimg.RepetitionTime)];
        ['TE: ' num2str(cimg.EchoTime)];
        ['TI: ' num2str(cimg.InversionTime)];
        ['RescaleSlope: ' num2str(cimg.RescaleSlope)];
        ['RescaleIntercept: ' num2str(cimg.RescaleIntercept)];
        ['Flip Angle: ' num2str(cimg.FlipAngle)];       
        ['Width: ' num2str(cimg.Width)];
        ['Columns: ' num2str(cimg.Columns)];
        ['Height: ' num2str(cimg.Height)];
        ['Rows: ' num2str(cimg.Rows)];  
        ['Slice Thickness: ' num2str(cimg.SliceThickness)];
        ['Slice Location: ' num2str(cimg.SliceLocation)];
        ['Pixel Bandwidth: ' num2str(cimg.PixelBandwidth)];
        ['Scanning Sequence: ' cimg.ScanningSequence];
        ['MR Acquisition Type: ' cimg.MRAcquisitionType];
        ['ID: ' cimg.PatientID];  
        ['Series Number: ' num2str(cimg.SeriesNumber)];
        ['Acquisition Number: ' num2str(cimg.AcquisitionNumber)];
        ['Instance Number: ' num2str(cimg.InstanceNumber)];
        ['Manufacturer: ' cimg.Manufacturer];            
       };
else
    info={['Protocol Name: ' cimg.ProtocolName];
        ['Sequence Name: ' cimg.SequenceName];
       ['TR: ' num2str(cimg.RepetitionTime)];
       ['TE: ' num2str(cimg.EchoTime)];
       ['Flip Angle: ' num2str(cimg.FlipAngle)];
       ['Width: ' num2str(cimg.Width)];
       ['Columns: ' num2str(cimg.Columns)];
       ['Height: ' num2str(cimg.Height)];
       ['Rows: ' num2str(cimg.Rows)];   
       ['Slice Thickness: ' num2str(cimg.SliceThickness)];
       ['Slice Location: ' num2str(cimg.SliceLocation)];
       ['Pixel Bandwidth: ' num2str(cimg.PixelBandwidth)];
       ['Scanning Sequence: ' cimg.ScanningSequence];
       ['MR Acquisition Type: ' cimg.MRAcquisitionType];
       ['ID: ' cimg.PatientID];
       ['Series Number: ' num2str(cimg.SeriesNumber)];
       ['Acquisition Number: ' num2str(cimg.AcquisitionNumber)];
       ['Instance Number: ' num2str(cimg.InstanceNumber)];
       ['Manufacturer: ' cimg.Manufacturer];
       };    
end



end