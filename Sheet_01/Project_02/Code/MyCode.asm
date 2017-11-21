
_main:

;MyCode.c,1 :: 		void main() {
;MyCode.c,6 :: 		TRISA.F4 = 1;
	BSF         TRISA+0, 4 
;MyCode.c,8 :: 		TRISB = 0;
	CLRF        TRISB+0 
;MyCode.c,13 :: 		T0CON = 0b11111000;  //Falling edage
	MOVLW       248
	MOVWF       T0CON+0 
;MyCode.c,18 :: 		for(;;)
L_main0:
;MyCode.c,20 :: 		PORTB = TMR0L;
	MOVF        TMR0L+0, 0 
	MOVWF       PORTB+0 
;MyCode.c,21 :: 		if(TMR0L > 9)
	MOVF        TMR0L+0, 0 
	SUBLW       9
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;MyCode.c,23 :: 		TMR0L = 0;
	CLRF        TMR0L+0 
;MyCode.c,24 :: 		}
L_main3:
;MyCode.c,25 :: 		}
	GOTO        L_main0
;MyCode.c,26 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
