
_newline:

;MyProject.c,2 :: 		void newline()
;MyProject.c,5 :: 		Uart1_write ('\r');      // \r is the carriage return
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,6 :: 		Uart1_write ('\n');      // \n is the line feed
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,7 :: 		}
L_end_newline:
	RETURN      0
; end of _newline

_interrupt:

;MyProject.c,12 :: 		void interrupt()
;MyProject.c,17 :: 		if(INT0IF_Bit==1)
	BTFSS       INT0IF_bit+0, BitPos(INT0IF_bit+0) 
	GOTO        L_interrupt0
;MyProject.c,20 :: 		INT0IF_Bit=0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;MyProject.c,22 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_interrupt1:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt1
	DECFSZ      R12, 1, 1
	BRA         L_interrupt1
	DECFSZ      R11, 1, 1
	BRA         L_interrupt1
	NOP
	NOP
;MyProject.c,24 :: 		if(INT0IF_Bit==1)
	BTFSS       INT0IF_bit+0, BitPos(INT0IF_bit+0) 
	GOTO        L_interrupt2
;MyProject.c,27 :: 		Uart1_Write_Text("Down");
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,28 :: 		PORTD.F1 = 1;
	BSF         PORTD+0, 1 
;MyProject.c,29 :: 		Delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_interrupt3:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt3
	DECFSZ      R12, 1, 1
	BRA         L_interrupt3
	DECFSZ      R11, 1, 1
	BRA         L_interrupt3
	NOP
	NOP
;MyProject.c,30 :: 		PORTD.F1 = 0;
	BCF         PORTD+0, 1 
;MyProject.c,31 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,32 :: 		INT0IF_Bit = 0;      // Clear INT0IF again to prevent recursive interrupt
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;MyProject.c,34 :: 		}
	GOTO        L_interrupt4
L_interrupt2:
;MyProject.c,38 :: 		Uart1_Write_Text("Up");
	MOVLW       ?lstr2_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,39 :: 		PORTD = 0b00000001;
	MOVLW       1
	MOVWF       PORTD+0 
;MyProject.c,40 :: 		Delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
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
;MyProject.c,41 :: 		PORTD = 0b00000000;
	CLRF        PORTD+0 
;MyProject.c,42 :: 		newline();
	CALL        _newline+0, 0
;MyProject.c,43 :: 		INT0IF_Bit = 0;      // Clear INT0IF again to prevent recursive interrupt
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;MyProject.c,44 :: 		}
L_interrupt4:
;MyProject.c,47 :: 		}
L_interrupt0:
;MyProject.c,49 :: 		}
L_end_interrupt:
L__interrupt10:
	RETFIE      1
; end of _interrupt

_main:

;MyProject.c,51 :: 		void main()
;MyProject.c,56 :: 		TRISB = 0xFF;   //button increment-button decrement as input
	MOVLW       255
	MOVWF       TRISB+0 
;MyProject.c,57 :: 		TRISD = 0; //FOR LED
	CLRF        TRISD+0 
;MyProject.c,61 :: 		GIE_Bit = 1;       // Enable all interrupts
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;MyProject.c,63 :: 		INT0IE_Bit = 1;    // INT0 Interrupt Enable
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;MyProject.c,64 :: 		INT0IF_Bit = 0;    // INT0 Interrupt Flag
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;MyProject.c,69 :: 		UART1_Init (9600); // Initialize UART with baud rate = 9600
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MyProject.c,71 :: 		while(1)
L_main6:
;MyProject.c,73 :: 		asm sleep;             // Make PIC 18F452 go to sleep until any interrupt occur and wake it up again
	SLEEP
;MyProject.c,74 :: 		}
	GOTO        L_main6
;MyProject.c,75 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
