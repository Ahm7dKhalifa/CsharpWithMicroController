
_main:

;MyProject.c,27 :: 		void main() {
;MyProject.c,31 :: 		TRISB = 0;          // make PORTB output for LCD
	CLRF        TRISB+0 
;MyProject.c,32 :: 		TRISC.F7 = 1;       // make RX input
	BSF         TRISC+0, 7 
;MyProject.c,33 :: 		TRISC.F6 = 0;       // make TX output
	BCF         TRISC+0, 6 
;MyProject.c,38 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MyProject.c,39 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,40 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,41 :: 		Lcd_Out(1,2,"Serial Comm ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,47 :: 		UART1_Init(9600);
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MyProject.c,50 :: 		i = 'A';
	MOVLW       65
	MOVWF       _i+0 
;MyProject.c,56 :: 		for ( ; ; )
L_main0:
;MyProject.c,62 :: 		while (PORTC.F0 !=0);
L_main3:
	BTFSS       PORTC+0, 0 
	GOTO        L_main4
	GOTO        L_main3
L_main4:
;MyProject.c,67 :: 		Uart1_write (i);
	MOVF        _i+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,68 :: 		Delay_ms(20);
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
;MyProject.c,70 :: 		if (Uart1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
;MyProject.c,74 :: 		t = Uart1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _t+0 
;MyProject.c,75 :: 		Lcd_Chr(2,8,t);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;MyProject.c,76 :: 		i++;
	INCF        _i+0, 1 
;MyProject.c,78 :: 		while (PORTC.F0 == 0);
L_main7:
	BTFSC       PORTC+0, 0 
	GOTO        L_main8
	GOTO        L_main7
L_main8:
;MyProject.c,80 :: 		}
L_main6:
;MyProject.c,82 :: 		}
	GOTO        L_main0
;MyProject.c,84 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
