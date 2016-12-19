function data = g1(numeral)
%G1 This function shall initiate whenever the gcode G1 is called.
%   Parameters are X, Y, and Z for the position to move to, E for the
%   amount to extrude between starting and ending point, and S for the
%   feedrate per minute of the move between starting point and ending point

for count = 3:size(numeral,1)
    if mod(count,2) == 1    %check if not divisible by two
        switch char(numeral(count))
            case 'X'
                x = numeral(count + 1);
            case 'Y'
                y = numeral(count + 1);
            case 'Z'
                z = numeral(count + 1);
            case 'E'
                e = numeral(count + 1);
            case 'F'
                f = numeral(count + 1);
            case 'S'
                s = numeral(count + 1);
        end
    end
end
end

