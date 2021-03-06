; Configuration file for RailcoreII 300ZL or ZLT Printer
; Debugging
M111 S0                                 ; Debug off
M929 P"eventlog.txt" S1                 ; Start logging to file eventlog.txt

M550 P"RailCore300ZL"                        ; Machine name and Netbios name (can be anything you like)
;M551 P"myrap"                          ; Machine password (used for FTP)

M98 P"wifi.g"                           ; Run WiFi configuration file.
M552 P0.0.0.0                           ; Use DHCP

;M586 P0 S1                             ; Enable HTTP (default) S0 to disable
;M586 P1 S0                             ; Disable FTP (default) S1 to enable
;M586 P2 S0                             ; Disable Telnet (default) S1 to enable

; General preferences
M555 P2                                 ; Set output to look like Marlin
M575 P1 B57600 S1                       ; Comms parameters for PanelDue

G21                                     ; Work in millimetres
G90                                     ; Send absolute coordinates...
M83                                     ; ...but relative extruder moves

; Axis and motor configuration
M669 K1                                 ; CoreXY mode

; Drives
M584 X0 Y1 Z5:6:7 E3:4:8:9  ; Map Z to drivers 5, 6, 7. Define unused drivers 3,4,8 and 9 as extruders
M569 P0 S0                  ; Drive 0 goes forwards (change to S0 to reverse it)| X stepper
M569 P1 S0                  ; Drive 1 goes backwards(change to S1 to reverse it)| Y Stepper
M569 P2 S1                  ; Drive 2 goes forwards                             | Unused
M569 P3 S0                  ; Drive 3 goes forwards                             | Extruder S1 for Bondtech, S0 for Titan
M569 P4 S1                  ; Drive 4 goes forwards                             | Extruder (unused)
M569 P5 S0                  ; Drive 5 goes backwards                            | Front Left Z
M569 P6 S0                  ; Drive 6 goes backwards                            | Rear Left Z
M569 P7 S0                  ; Drive 7 goes backwards                            | Right Z

;Leadscrew locations
M671 X-10:-10:333 Y22.5:277.5:150 S7.5 ;Front left,(-10,22.5) Rear Left (-10.,227.5) , Right (333,160) S7.5 is the max correction - measure your own offsets, to the bolt for the yoke of each leadscrew

; Axis and motor configuration
M350 X16 Y16 Z16 E16 I1                 ; Set 16x microstepping for axes & extruder, with interpolation.
M574 X1 Y1 S3		                    ; set sensorless homing for X/Y
M574 Z0 S0		                        ; set sensored homing for Z( z at max)
M906 X1400 Y1400 Z1000 E1000 I60        ; Set motor currents (mA)
M201 X4000 Y4000 Z20 E1000              ; Accelerations (mm/s^2)
M203 X24000 Y24000 Z900 E3600           ; Maximum speeds (mm/min)
M566 X1500 Y1500 Z30 E20                ; Maximum jerk speeds mm/minute
M208 X290 Y290 Z320                     ; Set axis maxima and high homing switch positions (adjust to suit your machine)
M208 X0 Y0 Z0 S1                        ; Set axis minima and low homing switch positions (adjust to make X=0 and Y=0 the edges of the bed)
M92 X200 Y200 Z1600 E830                ; Steps/mm

; Thermistors
M305 P0 S"Bed" T100000 B3950 R4700 H0 L0 ; BOM thermistor values. Put your own H and/or L values here to set the bed thermistor ADC correction
;M305 P1 T100000 B4240 R4700 H0 L0       ; E3D - Put your own H and/or L values here to set the first nozzle thermistor ADC correction
;M305 P1 T500000 B3800 R4700              ; Slice - Put your own H and/or L values here to set the first nozzle thermistor ADC correction      
M305 P1 X200                            ; PT100 Sensor config
M305 P107 S"Keenovo" X7 T100000 B4240 R4700 H0 L0 ; Secondary bed thermistor
M305 P106 S"Chamber" X6 T100000 B3950 R4700 H0 L0 ; Chamber Temp Thermistor

;Heaters

M570 S360                               ; Hot end may be a little slow to heat up so allow it 360 seconds
M143 S340                               ; Maximum heater temperature

; Fans
M106 P0 H-1                             ; Disable thermostatic mode for fan 0
M106 P1 H-1                             ; Disable thermostatic mode for fan 1
M106 P2 H-1                             ; Disable thermostatic mode for fan 2
M106 P0 S0                              ; Turn off fans
M106 P1 S0
M106 P2 S0

; Tool definitions
M563 P0 D0 H1                           ; Define tool 0
G10 P0 S0 R0                            ; Set tool 0 operating and standby temperatures
;*** If you have a single-nozzle build, comment the next 2 lines
;M563 P1 D1 H2                          ; Define tool 1
;G10 P1 S0 R0 X0 Y17                    ; Set tool 1 operating and standby temperatures

; Z probe and compensation definition

;IR Probe or Switch
;*** Comment this section out (or remove) if you are NOT using an IR Probe or Switch
;*** If you have a switch instead of an IR probe, change P1 to P4 in the following M558 command
;*** Do not use the Fxxx parameter for M558 here, it is set in homez.g
;M558 P1 X0 Y0 Z1                        ; Z probe is an IR probe and is not used for homing any axes
;G31 X0 Y30 Z2.00 P500                   ; Set the zprobe height and threshold (put your own values here)
                                        ; Tip: A larger trigger height in G31 moves you CLOSER to the bed

;BLTouch
;*** The section is commented out with semi-colons and therefore deactivated.
;*** If you have a BL-touch, to activate remove the semi-colons (and comment out IR Probe/Switch section
;*** otherwise leave commented out
M307 H3 A-1 C-1 D-1
M558 P9 X0 Y0 Z1 H5 F50 T6000 A5 S0.02
;G31 X2 Y42 Z2.32 P25 ; Customize your offsets appropriately. BLTouch v1
;G31 X2 Y42 Z1.55 P25 ; Customize your offsets appropriately. BLTouch v2 + Volcano
;G31 X2 Y42 Z1.68 P25 ; Customize your offsets appropriately. BLTouch v2 + Mosquito + Vanadium
;G31 X2 Y42 Z1.693 P25 ; Customize your offsets appropriately. BLTouch v2 + Mosquito + E3D Nozzle
G31 X2 Y42 Z1.90 P25 ; Customize your offsets appropriately. BLTouch v2 + Mosquito + E3D Nozzle + Subtle Design EverFlex
;G31 X2 Y42 Z1.94 P25 ; Customize your offsets appropriately. BLTouch v2 + Mosquito + Slice Nozzle + Garolite

;Switch Connected to E1
;M558 P4 C4 H5 R0 F500 T12000 I1 A5 S0.01
;G31 X0 Y42 Z0 P500

M208 S1 Z-0.2                           ; set minimum Z
T0                                      ; select first hot end

; Conservative settings enabled during build and testing. When you are ready to remove this
; simple protection, remove or comment out this line
; M98 P"conservative.g"
M501                                    ; Load saved parameters from non-volatile memory
