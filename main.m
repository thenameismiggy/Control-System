function main()
% This function shall serve as the main function for the entire system. All
%other functions shall stem from this piece of code.

[FileName, PathName] = uigetfile('*.gcode', 'Select the generated Gcode file');

fid = fopen(strcat(PathName, FileName), r+);
if fid == -1
	error('File could not be read. It may be corrupted.')
end

%code = {'code.gcode'};
%name = inputdlg('Enter filename:', 'Save G-code As',1,code);

%fid = fopen(name{1,1},'wt');
%fprintf(fid,text);
%fclose(fid);
