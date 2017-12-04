
_newline:

;MyProject.c,1 :: 		void newline()
;MyProject.c,4 :: 		Uart1_write ('\r');      // \r is the carriage return
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,5 :: 		Uart1_write ('\n');      // \n is the line feed
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,9 :: 		}
L_end_newline:
	RETURN      0
; end of _newline

_main:

;MyProject.c,16 :: 		void main()
;MyProject.c,21 :: 		TRISB = 0xff;   // Configure direction of ports
	MOVLW       255
	MOVWF       TRISB+0 
;MyProject.c,25 :: 		uart1_Init (9600); // Initialize UART with baud rate = 9600
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MyProject.c,27 :: 		for (;;)
L_main0:
;MyProject.c,31 :: 		if(PORTB.F0 == 1)
	BTFSS       PORTB+0, 0 
	GOTO        L_main3
;MyProject.c,33 :: 		Uart1_write_Text (" Open");
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,34 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,35 :: 		}
	GOTO        L_main4
L_main3:
;MyProject.c,38 :: 		Uart1_write_Text (" Closed");
	MOVLW       ?lstr2_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,39 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,40 :: 		}
L_main4:
;MyProject.c,43 :: 		if(PORTB.F1 == 1)
	BTFSS       PORTB+0, 1 
	GOTO        L_main5
;MyProject.c,45 :: 		Uart1_write_Text (" Open ");
	MOVLW       ?lstr3_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,46 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,47 :: 		}
	GOTO        L_main6
L_main5:
;MyProject.c,50 :: 		Uart1_write_Text (" Closed ");
	MOVLW       ?lstr4_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,51 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,52 :: 		}
L_main6:
;MyProject.c,55 :: 		if(PORTB.F2 == 1)
	BTFSS       PORTB+0, 2 
	GOTO        L_main7
;MyProject.c,57 :: 		Uart1_write_Text (" Open ");
	MOVLW       ?lstr5_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,58 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,59 :: 		}
	GOTO        L_main8
L_main7:
;MyProject.c,62 :: 		Uart1_write_Text (" Closed ");
	MOVLW       ?lstr6_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,63 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,64 :: 		}
L_main8:
;MyProject.c,67 :: 		if(PORTB.F3 == 1)
	BTFSS       PORTB+0, 3 
	GOTO        L_main9
;MyProject.c,69 :: 		Uart1_write_Text (" Open ");
	MOVLW       ?lstr7_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr7_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,70 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,71 :: 		}
	GOTO        L_main10
L_main9:
;MyProject.c,74 :: 		Uart1_write_Text (" Closed ");
	MOVLW       ?lstr8_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr8_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,75 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,76 :: 		}
L_main10:
;MyProject.c,79 :: 		if(PORTB.F4 == 1)
	BTFSS       PORTB+0, 4 
	GOTO        L_main11
;MyProject.c,81 :: 		Uart1_write_Text (" Open ");
	MOVLW       ?lstr9_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr9_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,82 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,83 :: 		}
	GOTO        L_main12
L_main11:
;MyProject.c,86 :: 		Uart1_write_Text (" Closed ");
	MOVLW       ?lstr10_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr10_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,87 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,88 :: 		}
L_main12:
;MyProject.c,91 :: 		if(PORTB.F5 == 1)
	BTFSS       PORTB+0, 5 
	GOTO        L_main13
;MyProject.c,93 :: 		Uart1_write_Text (" Open ");
	MOVLW       ?lstr11_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr11_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,94 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,95 :: 		}
	GOTO        L_main14
L_main13:
;MyProject.c,98 :: 		Uart1_write_Text (" Closed ");
	MOVLW       ?lstr12_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr12_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,99 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,100 :: 		}
L_main14:
;MyProject.c,103 :: 		if(PORTB.F6 == 1)
	BTFSS       PORTB+0, 6 
	GOTO        L_main15
;MyProject.c,105 :: 		Uart1_write_Text (" Open ");
	MOVLW       ?lstr13_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr13_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,106 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,107 :: 		}
	GOTO        L_main16
L_main15:
;MyProject.c,110 :: 		Uart1_write_Text (" Closed ");
	MOVLW       ?lstr14_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr14_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,111 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,112 :: 		}
L_main16:
;MyProject.c,115 :: 		if(PORTB.F7 == 1)
	BTFSS       PORTB+0, 7 
	GOTO        L_main17
;MyProject.c,117 :: 		Uart1_write_Text (" Open ");
	MOVLW       ?lstr15_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr15_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,118 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,119 :: 		}
	GOTO        L_main18
L_main17:
;MyProject.c,122 :: 		Uart1_write_Text (" Closed ");
	MOVLW       ?lstr16_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr16_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,123 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,124 :: 		}
L_main18:
;MyProject.c,125 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	DECFSZ      R11, 1, 1
	BRA         L_main19
	NOP
	NOP
;MyProject.c,127 :: 		}
	GOTO        L_main0
;MyProject.c,129 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
