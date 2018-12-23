; home Y
M400                    	; make sure everything has stopped before we make changes
M913 X30 Y30             	; reduce motor current to 50% to prevent belts slipping
M915 P0:1 S3 R0 F0

G91                   	 	; use relative positioning
G1 S1 Y-270 F4000    		; move to home position
G1 Y25 F2000          		; back off to edge of bed

G90            			; back to absolute positioning
M400
M913 X100 Y100        		; motor currents back to normal
