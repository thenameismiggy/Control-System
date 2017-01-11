function a(one, two, three)

global out;

rodlength = 22.8346;
printheadoffset = 57.15;
columnoffset = 14.2748;
tooloffset = 7.5;

for x = 0:-0.001:-1
    for y = 0:-0.001:-1
        for z = 0:-0.001:-1

            a1(1) = x + printheadoffset;
            a1(2) = y;
            a1(3) = z + tooloffset;
            b1(1) = x + (printheadoffset * cosd(120));
            b1(2) = x + (printheadoffset * sind(120));
            b1(3) = z + tooloffset;
            c1(1) = x + (printheadoffset * cosd(240));
            c1(2) = x + (printheadoffset * sind(240));
            c1(3) = z + tooloffset;
            a2(1) = columnoffset;
            a2(2) = 0;
            b2(1) = columnoffset * cosd(120);
            b2(2) = columnoffset * sind(120);
            c2(1) = columnoffset * cosd(240);
            c2(2) = columnoffset * sind(240);
            aa = sqrt(((a2(1) - a1(1))^2) + ((a2(2) - a1(2))^2));
            ab = sqrt(((b2(1) - b1(1))^2) + ((b2(2) - b1(2))^2));
            ac = sqrt(((c2(1) - c1(1))^2) + ((c2(2) - c1(2))^2));
            ha = sqrt(abs((rodlength^2) - (aa^2)));
            hb = sqrt(abs((rodlength^2) - (ab^2)));
            hc = sqrt(abs((rodlength^2) - (ac^2)));
            a = z + tooloffset + ha;
            b = z + tooloffset + hb;
            c = z + tooloffset + hc;
            
            if a == one && b == two && c == three
                out(1) = x
                out(2) = y
                out(3) = z
                return
            end
        end
    end
end