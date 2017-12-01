
_Interrupt:

;MyProject.c,1 :: 		void Interrupt(){
;MyProject.c,4 :: 		if (TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_Interrupt0
;MyProject.c,6 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;MyProject.c,7 :: 		TMR0H = 0x0B;
	MOVLW       11
	MOVWF       TMR0H+0 
;MyProject.c,8 :: 		TMR0L = 0xDB;
	MOVLW       219
	MOVWF       TMR0L+0 
;MyProject.c,10 :: 		PORTD = ~PORTD;
	COMF        PORTD+0, 1 
;MyProject.c,11 :: 		}
L_Interrupt0:
;MyProject.c,12 :: 		}
L_end_Interrupt:
L__Interrupt2:
	RETFIE      1
; end of _Interrupt

_main:

;MyProject.c,15 :: 		void main() {
;MyProject.c,20 :: 		TRISD = 0;
	CLRF        TRISD+0 
;MyProject.c,25 :: 		T0CON = 0b10000100;//EnableTimer0-16-internal clock-donot care-presaclar enabled - 1:8 prescaler  or T0CON= 0x84;
	MOVLW       132
	MOVWF       T0CON+0 
;MyProject.c,27 :: 		TMR0H	 = 0x0B;
	MOVLW       11
	MOVWF       TMR0H+0 
;MyProject.c,28 :: 		TMR0L	 = 0xDB;
	MOVLW       219
	MOVWF       TMR0L+0 
;MyProject.c,30 :: 		GIE_bit	 = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;MyProject.c,32 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;MyProject.c,35 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
