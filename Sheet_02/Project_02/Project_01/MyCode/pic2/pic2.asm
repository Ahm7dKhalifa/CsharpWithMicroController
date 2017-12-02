
_main:

;pic2.c,22 :: 		void main() {
;pic2.c,27 :: 		TRISB = 0;          // make PORTB output for LCD
	CLRF        TRISB+0 
;pic2.c,28 :: 		TRISC.F7 = 1;       // make RX input
	BSF         TRISC+0, 7 
;pic2.c,29 :: 		TRISC.F6 = 0;       // make TX output
	BCF         TRISC+0, 6 
;pic2.c,33 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;pic2.c,34 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;pic2.c,35 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;pic2.c,36 :: 		Lcd_Out(1,2,"TEMP = xx");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_pic2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_pic2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;pic2.c,40 :: 		UART1_Init(9600);
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;pic2.c,41 :: 		Delay_ms(20);
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
;pic2.c,42 :: 		for ( ; ; )
L_main1:
;pic2.c,44 :: 		if (Uart1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;pic2.c,46 :: 		t = Uart1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _t+0 
;pic2.c,47 :: 		Lcd_Chr(2,1,t);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;pic2.c,52 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;pic2.c,53 :: 		}
	GOTO        L_main6
L_main4:
;pic2.c,56 :: 		Lcd_Chr(2,1,'x');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       120
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;pic2.c,57 :: 		}
L_main6:
;pic2.c,60 :: 		}
	GOTO        L_main1
;pic2.c,62 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
