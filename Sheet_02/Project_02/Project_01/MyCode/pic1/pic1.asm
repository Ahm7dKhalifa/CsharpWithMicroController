
_main:

;pic1.c,9 :: 		void main() {
;pic1.c,15 :: 		TRISC.F7 = 1;       // make RX input
	BSF         TRISC+0, 7 
;pic1.c,16 :: 		TRISC.F6 = 0;       // make TX output
	BCF         TRISC+0, 6 
;pic1.c,20 :: 		UART1_Init(9600);
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;pic1.c,21 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	NOP
	NOP
;pic1.c,22 :: 		i = 'a';
	MOVLW       97
	MOVWF       _i+0 
;pic1.c,23 :: 		Uart1_write (i);
	MOVLW       97
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;pic1.c,24 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	NOP
	NOP
;pic1.c,41 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
