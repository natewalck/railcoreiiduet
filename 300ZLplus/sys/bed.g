M561                         ; clear any existing bed transform
G1 Z5 H2
G30 P0 X15 Y0 Z-99999
G30 P1 X15 Y260 Z-99999
G30 P2 X275 Y260 Z-99999
G30 P3 X275 Y0 Z-99999 S3
G1 X0 Y0 F5000               ; move the head to the corner