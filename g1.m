function counter = g1(numeral, counter)
%G1 This function shall initiate whenever the gcode G1 is called.
%   Parameters are X, Y, and Z for the position to move to, E for the
%   amount to extrude between starting and ending point, and F for the
%   feedrate per minute of the move between starting point and ending point

global rodlength printheadoffset columnoffset tooloffset
global previous xout yout zout x y z e f

for count = 3:size(numeral,1)
    if mod(count,2) == 1    %check if not divisible by two
        switch char(numeral(count))
            case 'X'    %the x-coordinate of the point
                x = numeral(count + 1);
            case 'Y'    %the y-coordinate of the point
                y = numeral(count + 1);
            case 'Z'    %the z-coordinate of the point
                z = numeral(count + 1);
            case 'E'    %amount to extrude (used as binary by software group)
                e = numeral(count + 1);
            case 'F'    %feedrate in mm per minute of the move
                f = numeral(count + 1);
        end
    end
end

%obtain distance between current point and desired point
xtemp = (x - previous(1))^2;
ytemp = (y - previous(2))^2;
ztemp = (z - previous(3))^2;
distance = sqrt(xtemp + ytemp + ztemp);

%computes for time to be taken when traveling to desired point
time = distance / (f / 60);

%sets value of current point (previous point in next loop)
previous = [x y z];

%computing for the coordinates of the rod - printhead intersections
a1(1) = x + printheadoffset;
a1(2) = y;
a1(3) = z + tooloffset;
b1(1) = x + (printheadoffset * cosd(120));
b1(2) = y + (printheadoffset * sind(120));
b1(3) = z + tooloffset;
c1(1) = x + (printheadoffset * cosd(240));
c1(2) = y + (printheadoffset * sind(240));
c1(3) = z + tooloffset;

%computing for the coordinates of the rod - carriage intersections
a2(1) = columnoffset;
a2(2) = 0;
b2(1) = columnoffset * cosd(120);
b2(2) = columnoffset * sind(120);
c2(1) = columnoffset * cosd(240);
c2(2) = columnoffset * sind(240);

%computing for the horizontal length of the rods
aa = sqrt(((a2(1) - a1(1))^2) + ((a2(2) - a1(2))^2));
ab = sqrt(((b2(1) - b1(1))^2) + ((b2(2) - b1(2))^2));
ac = sqrt(((c2(1) - c1(1))^2) + ((c2(2) - c1(2))^2));

%computing for the vertical length of the rods
ha = sqrt(abs((rodlength^2) - (aa^2)));
hb = sqrt(abs((rodlength^2) - (ab^2)));
hc = sqrt(abs((rodlength^2) - (ac^2)));

%computation for final carriage lengths
xout(1, counter) = (z + tooloffset + ha) - 639.1952;
yout(1, counter) = (z + tooloffset + hb) - 639.1952;
zout(1, counter) = (z + tooloffset + hc) - 639.1952;

counter = counter + 1;

end