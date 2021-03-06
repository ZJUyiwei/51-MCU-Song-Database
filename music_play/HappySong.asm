
OUTPUT BIT P1.0
	
ORG 0000H
	LJMP START
ORG 000BH
	LJMP INT00
ORG 0030H
START:MOV TMOD, #01H
	SETB ET0
	SETB EA
MUSIC0:CLR A
	MOV 40H, A 
MUSIC1:MOV DPTR, #TABLE_Mohe  ; here is your music database
	MOV A, 40H
	MOVC A, @A+DPTR 
	JZ END0 
	MOV 30H, A 
	ANL A, #0FH 
	MOV 31H, A 
	MOV A, 30H
	SWAP A
	ANL A, #0FH
	MOV 32H,A 
	
MUSIC2: MOV DPTR,# TABLE1 
	MOV A, 32H
	RL A
	MOV 34H,A
	MOVC A,@A+DPTR
	MOV TH0,A 
	MOV 44H,A 
	INC 34H
	MOV A,34H
	MOVC A,@A+DPTR
	MOV TL0,A 
	MOV 45H,A
	SETB TR0
	
DEL_NS:LCALL DLY125ms 
	DJNZ 31H, DEL_NS 
	INC 40H 
	SJMP MUSIC1
	
END0: CLR TR0 
	LCALL DLY125ms
	LCALL DLY125ms
	LCALL DLY125ms
	LCALL DLY125ms
	SJMP MUSIC0
	
	
DLY125ms: MOV R3, #5
DEL2: MOV R4, #50 
DEL3: MOV R5, #250 
DEL4: DJNZ R5, DEL4
	DJNZ R4, DEL3
	DJNZ R3, DEL2
	RET
	
INT00:MOV TH0, 44H 
	MOV TL0, 45H
	CPL OUTPUT
	RETI



TABLE_order:
DB  44H, 54H, 64H, 74H, 84H, 94H, 0A4H, 00H

TABLE_fish: 
DB  22H, 42H, 42H, 52H, 52H, 62H, 62H, 81H
DB  91H, 86H, 62H, 54H, 04H, 22H, 42H, 42H
DB  52H, 52H, 62H, 64H, 24H, 18H, 04H, 22H
DB  42H, 42H, 52H, 52H, 62H, 62H, 81H, 91H
DB  86H, 62H, 54H, 04H, 52H, 62H, 24H, 52H
DB  62H, 22H, 12H, 28H, 04H, 22H, 42H, 56H
DB  42H, 24H, 22H, 42H, 56H, 42H, 64H, 62H
DB  82H, 94H, 92H, 82H, 62H, 52H, 44H, 54H
DB  68H, 22H, 42H, 56H, 42H, 24H, 22H, 42H
DB  54H, 44H, 68H, 52H, 62H, 24H, 52H, 62H
DB  22H, 12H, 24H, 04H, 04H
DB  62H, 82H,0B6H,0A2H, 64H, 62H, 52H, 44H
DB  42H, 52H, 64H, 62H, 52H, 44H, 92H,0B2H
DB 0A2H, 92H, 82H, 52H, 68H, 04H, 62H, 82H
DB 0B6H,0A2H, 64H, 62H, 52H, 44H, 42H, 52H
DB  68H, 52H, 62H, 24H, 52H, 62H, 22H, 12H
DB  2CH, 04H, 00H
	
	
TABLE_west:
DB 22H,44H,22H,66H,52H, 52H,46H,48H, 32H,24H,32H,56H,62H
DB 42H,26H,28H,68H,96H,62H,94H,82H,72H,68H,48H,52H,64H,72H,62H
DB 58H, 58H, 24H,64H,52H,62H,22H,4CH,64H,52H,34H,62H,52H,22H,42H,52H
DB 68H, 68H, 68H,96H,62H,94H,82H,72H,66H,82H,54H,72H,62H,52H,44H
DB 5CH,64H,52H,34H,62H,32H,22H,12H,28H, 28H, 00H

TABLE_happy: DB 64H, 64H,74H,84H,84H,74H,64H,54H
DB 44H, 44H,54H,64H,66H,52H,58H
DB 64H, 64H,74H,84H,84H,74H,64H,54H
DB 44H, 44H,54H,64H,56H,42H,48H;
DB 54H, 54H,64H,44H,54H,62H,72H,64H,44H
DB 54H, 62H,72H,64H,54H,44H,54H,14H,64H
DB 64H, 64H,74H,84H,84H,74H,64H,72H,52H
DB 44H, 44H,54H,64H,56H,42H,48H,00H



TABLE_LOVE:
DB 0CH,02H,41H,11H, 23H,21H,22H,12H,43H,41H,02H,41H,11H, 23H,21H,22H,12H,43H,61H,02H,41H,11H
DB 93H,91H,91H,91H,82H,43H,41H,41H,41H,52H, 43H,41H,01H,41H,22H,64H,04H, 43H,41H,01H,51H,52H,63H,41H,02H,11H,21H
DB 43H,41H,01H,51H,52H,63H,41H,02H,22H, 42H,21H,41H,02H,22H,42H,21H,41H,02H,42H, 71H,62H,41H,42H,22H,64H,04H
DB 43H,41H,01H,51H,52H,63H,41H,02H,11H,21H, 43H,41H,01H,51H,52H,63H,41H,02H,22H
DB 42H,21H,41H,02H,22H,42H,21H,41H,02H,42H, 71H,62H,41H,42H,52H,44H,02H,01H,01H
;DB 44H,04H,02H,52H,52H,02H, 64H,04H,42H,52H,62H,02H
;DB 44H,04H,02H,52H,52H,02H, 64H,04H,42H,62H,22H,02H
;DB 44H,04H,02H,52H,52H,02H, 64H,04H,42H,52H,62H,02H
;DB 44H,04H,02H,52H,52H,02H, 64H,04H,42H,62H,42H,02H
DB 62H,72H,62H,72H,82H,02H,62H,72H, 62H,72H,82H,02H,82H,72H,62H,72H
DB 61H,41H,41H,41H,41H,41H,22H,61H,42H,41H,41H,41H,22H, 41H,42H,41H,41H,41H,22H,64H,04H
DB 62H,72H,62H,72H,82H,02H,62H,72H, 62H,72H,82H,02H,82H,72H,62H,72H
DB 61H,41H,41H,41H,41H,41H,22H,61H,42H,41H,41H,41H,52H, 41H,42H,41H,41H,41H,62H,44H,04H
DB 84H,64H,54H,62H,62H, 52H,42H,52H,62H,64H,02H,62H, 94H,64H,54H,42H,42H, 42H,52H,62H,52H,54H,04H
DB 84H,64H,54H,62H,62H, 52H,42H,52H,62H,64H,02H,62H, 94H,64H,44H,64H, 44H,08H,04H,00H

TABLE_Mohe:
DB 62H,22H,22H,31H,43H,52H,62H,42H,62H,62H,62H,81H,65H
DB 02H,61H,61H,52H,52H,52H,61H,75H
DB 02H,12H,62H,62H,62H,51H,71H,34H
DB 04H,22H,32H,42H,51H,63H,42H,62H,42H,62H,62H,62H,81H,65H
DB 02H,61H,61H,52H,52H,52H,62H,74H
DB 04H,12H,62H,62H,52H,0A4H
DB 04H,96H,62H,22H
DB 02H,22H,82H,76H,61H,75H
DB 04H,86H,52H,12H
DB 02H,12H,82H,66H,72H,62H,72H
DB 02H,96H,62H,22H
DB 02H,22H,82H,76H,61H,75H
DB 02H,72H,62H,72H,61H,72H,71H,62H,72H,6CH, 00H



;table 1 is the frequency match-table
TABLE1:DB 00H,00H,0FBH, 04H,0FBH,0CCH,0FCH,0CH ;LOW 5_7
DB 0FCH, 44H,0FCH,0ACH,0FDH,09H ;CENTER 1_3
DB 0FDH, 34H,0FDH,82H,0FDH,0C8H ;CENTER 4_5
DB 0FEH, 06H,0FEH,22H,0FEH,56H ;CENTER 6-HIGH 1
DB 0FEH, 85H,0FEH,9AH,0FEH,0C1H ;HIGH 2_5

END
