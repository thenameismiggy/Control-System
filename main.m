function main()
%Main This function shall serve as the main function for the entire system.
%     All other functions shall stem from this piece of code.

global rodlength printheadoffset columnoffset tooloffset

[File, Path] = uigetfile('*.gcode', 'Select the generated Gcode file');

fid = fopen(strcat(Path, File));
while fid == -1    %if open code returns error
	error('File could not be read. It may be corrupted.');
end

currentline = fgetl(fid);
while (~feof(fid))
    if isempty(currentline) == 0
        if currentline(1) == 'M'
            numeral = sscanf(currentline, '%c%d %c%d %c%d');
            switch(numeral(2))
                case 82    %set extruder to absolute positioning
				    %TODO
                case 83    %set extruder to relative positioning
				    %TODO
                case 104    %set extruder temperature
                case 107    %turn off fan
                case 109    %set extruder temperature and wait
            end
        elseif currentline(1) == 'G'
            numeral = sscanf(currentline, '%c%f %c%f %c%f %c%f %c%f %c%f');
            switch(numeral(2))
                case 1    %move
                    data = g1(numeral);
                case 2    %CW controlled arc move
				    %TODO
                case 3    %CCW controlled arc move
				    %TODO
                case 20    %set units to inches
                    rodlength = 8.99;
                    printheadoffset = 2.25;
                    columnoffset = 5.62;
					tooloffset = 0.2953;
                case 21    %set units to mm
                    rodlength = 22.8346;
                    printheadoffset = 57.15;
                    columnoffset = 14.2748;
					tooloffset = 7.5;
                case 28    %move to origin
					%TODO: function that sets printhead to origin if not already
                case 90    %set to absolute positioning
				    %TODO
                case 91    %set to relative positioning
				    %TODO
                case 92    %set position
				    %TODO: function that changes the position of origin
            end
        end	
    end
    currentline = fgetl(fid);
end
fclose(fid);
end