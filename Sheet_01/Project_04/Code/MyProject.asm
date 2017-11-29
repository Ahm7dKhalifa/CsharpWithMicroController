
_interrupt:

;MyProject.c,2 :: 		void interrupt()
;MyProject.c,4 :: 		if( INTCON.INT0IF = 1)
	BSF         INTCON+0, 1 
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt0
;MyProject.c,6 :: 		for(i = 0; i<= 9; i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_interrupt1:
	MOVLW       0
	MOVWF       R0 
	MOVF        _i+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt11
	MOVF        _i+0, 0 
	SUBLW       9
L__interrupt11:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt2
;MyProject.c,8 :: 		PORTC = 0xff;
	MOVLW       255
	MOVWF       PORTC+0 
;MyProject.c,9 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_interrupt4:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt4
	DECFSZ      R12, 1, 1
	BRA         L_interrupt4
	DECFSZ      R11, 1, 1
	BRA         L_interrupt4
	NOP
	NOP
;MyProject.c,10 :: 		PORTC = 0;
	CLRF        PORTC+0 
;MyProject.c,11 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_interrupt5:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt5
	DECFSZ      R12, 1, 1
	BRA         L_interrupt5
	DECFSZ      R11, 1, 1
	BRA         L_interrupt5
	NOP
	NOP
;MyProject.c,6 :: 		for(i = 0; i<= 9; i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;MyProject.c,12 :: 		}
	GOTO        L_interrupt1
L_interrupt2:
;MyProject.c,13 :: 		}
L_interrupt0:
;MyProject.c,15 :: 		}
L_end_interrupt:
L__interrupt10:
	RETFIE      1
; end of _interrupt

_interrupt_low:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;MyProject.c,16 :: 		void interrupt_low()
;MyProject.c,18 :: 		if(INTCON3.INT2IF == 1)
	BTFSS       INTCON3+0, 1 
	GOTO        L_interrupt_low6
;MyProject.c,20 :: 		if( PORTD <= 9 )
	MOVF        PORTD+0, 0 
	SUBLW       9
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt_low7
;MyProject.c,22 :: 		PORTD++;
	MOVF        PORTD+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;MyProject.c,23 :: 		}
	GOTO        L_interrupt_low8
L_interrupt_low7:
;MyProject.c,26 :: 		PORTD = 0;
	CLRF        PORTD+0 
;MyProject.c,27 :: 		}
L_interrupt_low8:
;MyProject.c,29 :: 		}
L_interrupt_low6:
;MyProject.c,30 :: 		INTCON3.INT2IF = 0;
	BCF         INTCON3+0, 1 
;MyProject.c,31 :: 		}
L_end_interrupt_low:
L__interrupt_low13:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _interrupt_low

_main:

;MyProject.c,32 :: 		void main() {
;MyProject.c,33 :: 		TRISB = 0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;MyProject.c,34 :: 		TRISC = 0;
	CLRF        TRISC+0 
;MyProject.c,35 :: 		TRISD = 0;
	CLRF        TRISD+0 
;MyProject.c,36 :: 		PORTC = 0;
	CLRF        PORTC+0 
;MyProject.c,37 :: 		PORTD = 0;
	CLRF        PORTD+0 
;MyProject.c,41 :: 		RCON.IPEN = 1; //interrupt priority enable
	BSF         RCON+0, 7 
;MyProject.c,42 :: 		INTCON.GIEH = 1; //global interrupt enable  high priority
	BSF         INTCON+0, 7 
;MyProject.c,43 :: 		INTCON.GIEL = 1; //global interrupt enable  low priority
	BSF         INTCON+0, 6 
;MyProject.c,45 :: 		INTCON.INT0IE = 1; //int0 interrupt enable
	BSF         INTCON+0, 4 
;MyProject.c,46 :: 		INTCON.INT0IF = 0; //int0 interrupt FLAG
	BCF         INTCON+0, 1 
;MyProject.c,49 :: 		INTCON3.INT2IE = 1;  //int2 interrupt enable
	BSF         INTCON3+0, 4 
;MyProject.c,50 :: 		INTCON3.INT2IF = 0; //int2 interrupt FLAG
	BCF         INTCON3+0, 1 
;MyProject.c,51 :: 		INTCON3.INT2IP = 0; //int2 interrupt priority (LOW)
	BCF         INTCON3+0, 7 
;MyProject.c,52 :: 		INTCON2.INTEDG2 = 0; //int2 edge
	BCF         INTCON2+0, 4 
;MyProject.c,53 :: 		asm sleep;
	SLEEP
;MyProject.c,54 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
