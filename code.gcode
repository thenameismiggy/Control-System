;made by software development group

; infill extrusion width = 1mm

M107
M104 S230
G28 ; home all axes
G1 Z5 F2400 ; lift nozzle

M109 S230 ; wait for temperature to be reached
G21 ; set unit to millimeters
G90 ; use absolute coordinates
M82 ; use absolute coordinates for extrusion
G92 E0
G1 Z0.1 F2400
G1 E-2.0 F2400
G92 E0

;G1 X0 Y40
;G1 X0 Y0
;G1 X0 Y40
;G1 X0 Y0
;G1 X0 Y40
;G1 X0 Y0
;G1 X0 Y40
;G1 X0 Y0
;G1 X0 Y40
;G1 X0 Y0
;G1 X0 Y40
;G1 X0 Y0
;G1 X0 Y40
;G1 X0 Y0
;G1 X0 Y40
;G1 X0 Y0

G1 X0.00 Y0.00
G1 X1.76 Y2.40
G1 X1.97 Y3.85
G1 X1.60 Y3.50
G1 X0.71 Y3.21
G1 X0.66 Y2.94
G1 X1.53 Y3.16
G1 X1.52 Y3.00
G1 X0.61 Y2.72
G1 X0.60 Y2.57
G1 X1.43 Y2.75
G1 X1.40 Y2.59
G1 X0.47 Y2.33
G1 X0.00 Y1.90
G1 X0.00 Y0.00

G92 E0
M104 S0
G28 X0

; filament diameter = 1.75
; nozzle diameter = 5
; temperature = 230
; layer height = 0.1