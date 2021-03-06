% Matlab program to read a capture
% generated by capture_wave
function capture = read_capture_v1(fname)
%
% returns a structure with these components
%    data - sensor data
%    fname - file name where the data was read from
%    pvname
%    elem_size - size of the sensor data, in bytes
%    

capture.data = [];
capture.fname = fname;
file = fopen(fname,'r');
checks.header = 'DATA DUMP FILE v1.0';
checks.tail = 'END DATA DUMP FILE v1.0';
header = read_str(file);
if (strcmp(header,checks.header))
    disp('header okay');
else
    disp('header not okay');
    fclose(file);
    return
end
capture.datetime = read_str(file);
capture.pvname = read_str(file);
capture.dbfType = fread(file, 1, 'int32');
capture.dbrType = fread(file, 1, 'int32');
capture.nElems = fread(file, 1, 'uint32');
capture.reqElems = fread(file, 1, 'uint32');
capture.elem_size = fread(file, 1, 'int32');
type = 'int32';
switch capture.elem_size
    case 2
        type = 'int16';
    case 4
        type = 'int32';
    case 1
        type = 'int8';
    otherwise
        disp(sprintf('unexpected element size %d',capture.elem_size));
        return
end
capture.data = fread(file, capture.reqElems, type);
tail = read_str(file);
if (strcmp(tail, checks.tail))
    disp('tail okay');
else
    disp('tail not okay');
end

fclose(file);
return
