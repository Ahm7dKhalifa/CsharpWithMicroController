
_main:

;MyCode.c,1 :: 		void main() {
;MyCode.c,6 :: 		TRISA.F4 = 1;
	BSF         TRISA+0, 4 
;MyCode.c,8 :: 		TRISC = 0;
	CLRF        TRISC+0 
;MyCode.c,9 :: 		TRISD = 0;
	CLRF        TRISD+0 
;MyCode.c,10 :: 		PORTD = 0;
	CLRF        PORTD+0 
;MyCode.c,15 :: 		T0CON = 0b11111000;  //Falling edage
	MOVLW       248
	MOVWF       T0CON+0 
;MyCode.c,21 :: 		for(;;)
L_main0:
;MyCode.c,23 :: 		PORTC = TMR0L;
	MOVF        TMR0L+0, 0 
	MOVWF       PORTC+0 
;MyCode.c,25 :: 		if(TMR0L == 9)
	MOVF        TMR0L+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;MyCode.c,27 :: 		TMR0L = 0;
	CLRF        TMR0L+0 
;MyCode.c,29 :: 		if(PORTD < 9)
	MOVLW       9
	SUBWF       PORTD+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;MyCode.c,31 :: 		PORTD ++;
	MOVF        PORTD+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;MyCode.c,32 :: 		}
	GOTO        L_main5
L_main4:
;MyCode.c,36 :: 		PORTD = 0;
	CLRF        PORTD+0 
;MyCode.c,37 :: 		}
L_main5:
;MyCode.c,38 :: 		}
L_main3:
;MyCode.c,39 :: 		}
	GOTO        L_main0
;MyCode.c,40 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
