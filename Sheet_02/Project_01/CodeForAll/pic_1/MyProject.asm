
_main:

;MyProject.c,23 :: 		void main() {
;MyProject.c,28 :: 		TRISB = 0;          // make PORTB output for LCD
	CLRF        TRISB+0 
;MyProject.c,29 :: 		TRISC.F7 = 1;       // make RX input
	BSF         TRISC+0, 7 
;MyProject.c,30 :: 		TRISC.F6 = 0;       // make TX output
	BCF         TRISC+0, 6 
;MyProject.c,34 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MyProject.c,35 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,36 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,37 :: 		Lcd_Out(1,2,"pic 1");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,41 :: 		UART1_Init(9600);
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MyProject.c,42 :: 		i = 'A';
	MOVLW       65
	MOVWF       _i+0 
;MyProject.c,45 :: 		Delay_ms(3000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;MyProject.c,47 :: 		Uart1_write (i);
	MOVF        _i+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,48 :: 		Delay_ms(20);
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
;MyProject.c,52 :: 		for ( ; ; )
L_main2:
;MyProject.c,55 :: 		if (Uart1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
;MyProject.c,57 :: 		t = Uart1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _t+0 
;MyProject.c,59 :: 		if( t == 'r' || t == 'R')
	MOVF        R0, 0 
	XORLW       114
	BTFSC       STATUS+0, 2 
	GOTO        L__main15
	MOVF        _t+0, 0 
	XORLW       82
	BTFSC       STATUS+0, 2 
	GOTO        L__main15
	GOTO        L_main8
L__main15:
;MyProject.c,61 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,62 :: 		Lcd_Chr(2,8,t);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _t+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;MyProject.c,63 :: 		i++;
	INCF        _i+0, 1 
;MyProject.c,65 :: 		Uart1_write (i);
	MOVF        _i+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,66 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	NOP
	NOP
;MyProject.c,67 :: 		}
L_main8:
;MyProject.c,69 :: 		if( t == 'e' || t == 'E')
	MOVF        _t+0, 0 
	XORLW       101
	BTFSC       STATUS+0, 2 
	GOTO        L__main14
	MOVF        _t+0, 0 
	XORLW       69
	BTFSC       STATUS+0, 2 
	GOTO        L__main14
	GOTO        L_main12
L__main14:
;MyProject.c,71 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,72 :: 		Lcd_Chr(2,8,t);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _t+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;MyProject.c,74 :: 		Uart1_write (i);
	MOVF        _i+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,75 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	NOP
	NOP
;MyProject.c,76 :: 		}
L_main12:
;MyProject.c,77 :: 		}
L_main5:
;MyProject.c,79 :: 		}
	GOTO        L_main2
;MyProject.c,81 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
