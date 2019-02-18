M561                         ; clear any existing bed transform
G1 Z5 F400 S2
G30 P0 X18 Y45 Z-99999
G30 P1 X18 Y227.5 Z-99999
G30 P2 X236 Y125 Z-99999 S3
G1 X0 Y0 F5000               ; move the head to the corner (optional)