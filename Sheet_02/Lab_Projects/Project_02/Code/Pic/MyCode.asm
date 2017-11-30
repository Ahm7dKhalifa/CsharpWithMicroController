
_main:

;MyCode.c,19 :: 		void main()
;MyCode.c,21 :: 		ADCON1 = 0X07;                // make PortA.Bit0 digital input
	MOVLW       7
	MOVWF       ADCON1+0 
;MyCode.c,22 :: 		TRISA=0xFF;
	MOVLW       255
	MOVWF       TRISA+0 
;MyCode.c,23 :: 		TRISB = TRISD = 0;           // output ports
	CLRF        TRISD+0 
	MOVF        TRISD+0, 0 
	MOVWF       TRISB+0 
;MyCode.c,24 :: 		TRISC.B7 = 1;                // make RX input
	BSF         TRISC+0, 7 
;MyCode.c,25 :: 		TRISC.B6 = 0;                // make TX output
	BCF         TRISC+0, 6 
;MyCode.c,27 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MyCode.c,28 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyCode.c,29 :: 		LCD_out (1,1,"Serial PC 7Seg");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_MyCode+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_MyCode+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyCode.c,31 :: 		uart1_init(9600);        // initialize UART with a baud rate of 9600
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MyCode.c,32 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	NOP
	NOP
;MyCode.c,34 :: 		for ( ; ; )
L_main1:
;MyCode.c,36 :: 		if(uart1_data_ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;MyCode.c,38 :: 		uart_rd = uart1_read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;MyCode.c,39 :: 		if (uart_rd == 'u'||uart_rd == 'U')
	MOVF        R0, 0 
	XORLW       117
	BTFSC       STATUS+0, 2 
	GOTO        L__main15
	MOVF        _uart_rd+0, 0 
	XORLW       85
	BTFSC       STATUS+0, 2 
	GOTO        L__main15
	GOTO        L_main7
L__main15:
;MyCode.c,41 :: 		cnt++;
	INFSNZ      _cnt+0, 1 
	INCF        _cnt+1, 1 
;MyCode.c,42 :: 		if(cnt > 5) cnt = 0;
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _cnt+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main17
	MOVF        _cnt+0, 0 
	SUBLW       5
L__main17:
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
	CLRF        _cnt+0 
	CLRF        _cnt+1 
L_main8:
;MyCode.c,43 :: 		portd = cnt;        // Increment 7segment
	MOVF        _cnt+0, 0 
	MOVWF       PORTD+0 
;MyCode.c,45 :: 		porta.b0 = 1;  // Turn on the Green LED
	BSF         PORTA+0, 0 
;MyCode.c,46 :: 		porta.b1 = 0;  // Turn off the Red LED
	BCF         PORTA+0, 1 
;MyCode.c,47 :: 		lcd_out (2,1,"  Counter  UP    ");        // (optional) display a message on the LCD
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_MyCode+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_MyCode+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyCode.c,48 :: 		}
	GOTO        L_main9
L_main7:
;MyCode.c,49 :: 		else if (uart_rd == 'd'||uart_rd == 'D')
	MOVF        _uart_rd+0, 0 
	XORLW       100
	BTFSC       STATUS+0, 2 
	GOTO        L__main14
	MOVF        _uart_rd+0, 0 
	XORLW       68
	BTFSC       STATUS+0, 2 
	GOTO        L__main14
	GOTO        L_main12
L__main14:
;MyCode.c,51 :: 		cnt--;       // Decrement 7segment
	MOVLW       1
	SUBWF       _cnt+0, 1 
	MOVLW       0
	SUBWFB      _cnt+1, 1 
;MyCode.c,52 :: 		if(cnt < 0) cnt = 5;
	MOVLW       128
	XORWF       _cnt+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main18
	MOVLW       0
	SUBWF       _cnt+0, 0 
L__main18:
	BTFSC       STATUS+0, 0 
	GOTO        L_main13
	MOVLW       5
	MOVWF       _cnt+0 
	MOVLW       0
	MOVWF       _cnt+1 
L_main13:
;MyCode.c,53 :: 		portd = cnt;
	MOVF        _cnt+0, 0 
	MOVWF       PORTD+0 
;MyCode.c,55 :: 		porta.b0 = 0;  // Turn off the Green LED
	BCF         PORTA+0, 0 
;MyCode.c,56 :: 		porta.b1 = 1;  // Turn on the Red LED
	BSF         PORTA+0, 1 
;MyCode.c,57 :: 		lcd_out (2,1,"  Counter Down   ");        // (optional) display a message on the LCD
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_MyCode+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_MyCode+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyCode.c,58 :: 		}
L_main12:
L_main9:
;MyCode.c,59 :: 		}
L_main4:
;MyCode.c,60 :: 		}
	GOTO        L_main1
;MyCode.c,61 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
