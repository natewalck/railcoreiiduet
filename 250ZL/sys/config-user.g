; General settings
M550 P"RailCore250ZL"                        ; Machine name and Netbios name (can be anything you like)

; Axis and motor configuration
M584 Z5:6:7							; Z steppers are 5 (front left) 6(rear left) 7(right) on the duex5
M667 S1								; CoreXY mode
M569 P0 S0                          ; Drive 0 goes forwards (change to S0 to reverse it)
M569 P1 S1                          ; Drive 1 goes backwards
M569 P2 S1                          ; Drive 2 goes forwards
M569 P3 S0                          ; Extruder (Drive 3) S1 for Bondtech, S0 for Titan
M569 P4 S1                          ; Drive 4 goes forwards
M569 P5 S0							; Drive 5 goes backwards
M569 P6 S0							; Drive 6 goes backwards
M569 P7 S0							; Drive 7 goes backwards

;Leadscrew locations
M671 X-10:-10:333 Y22.5:277.5:150 S7.5 ;Front left, Rear Left, Right S7.5 is the max correction - measure your own offsets, to the bolt for the yoke of each leadscrew

; Homing
M574 X1 Y1 S3		                ; set sensorless homing for X/Y
M574 Z0 S0		                    ; set sensored homing for Z( z at max)

; Stepper settings
M906 X900 Y900 Z800 E900 I60	    ; Set motor currents (mA)

; Set axis minima:maxima switch positions
M208 X0:220 Y0:240 Z-0.2:230        ; 250ZL

M92 X201.5 Y201.5 Z1600 	        ; Steps/mm for X.Y & Z
M92 E837                            ; Extruder - Bondtech BMG Steps/mm with 0.9 deg stepper

; PID tuning
M307 H0 A92.4 C462.7 D5.9 S1.00 V24.2 B0  ; Heated Bed (H0) PID tuning settings
M307 H1 A351.9 C170.9 D6.2 S1.00 V24.3 B0 ; Hotend (H1) PID tuning settings

; Hotend
M143 H1 S320                        ; Maximum H1 (Extruder) heater temperature

; Filament Sensor
M591 D0 P5 C3 R40:120 E3.0 S0       ; laser filament monitor

; Z probe and compensation definition
M558 P1 X0 Y0 Z1			        ; Z probe is an IR probe and is not used for homing any axes
G31 X7 Y37 Z1.15 P500	 	    	; Set the zprobe height and threshold (put your own values here)
