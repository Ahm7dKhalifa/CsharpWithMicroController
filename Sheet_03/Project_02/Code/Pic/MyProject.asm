
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
;MyProject.c,21 :: 		TRISA = 0xff;   // Configure direction of ports
	MOVLW       255
	MOVWF       TRISA+0 
;MyProject.c,22 :: 		ADCON1 = 0x80;  // Configure all pins of PORTA as A/D channels
	MOVLW       128
	MOVWF       ADCON1+0 
;MyProject.c,26 :: 		uart1_Init (9600); // Initialize UART with baud rate = 9600
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MyProject.c,28 :: 		for (;;)
L_main0:
;MyProject.c,31 :: 		adc1 = adc_read(0);           // Read temperature 1 from LM35 on AN0 of PORTA
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adc1+0 
	MOVF        R1, 0 
	MOVWF       _adc1+1 
;MyProject.c,32 :: 		temp1 = (adc1 * 500)/ 1024;   // Calculate equivalent value of LM35 temperature
	MOVLW       244
	MOVWF       R4 
	MOVLW       1
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       10
	MOVWF       R2 
	MOVF        R0, 0 
	MOVWF       _temp1+0 
	MOVF        R1, 0 
	MOVWF       _temp1+1 
	MOVF        R2, 0 
L__main6:
	BZ          L__main7
	RRCF        _temp1+1, 1 
	RRCF        _temp1+0, 1 
	BCF         _temp1+1, 7 
	BTFSC       _temp1+1, 6 
	BSF         _temp1+1, 7 
	ADDLW       255
	GOTO        L__main6
L__main7:
;MyProject.c,34 :: 		adc2 = adc_read(1);           // Read temperature 2 from LM35 on AN1 of PORTA
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adc2+0 
	MOVF        R1, 0 
	MOVWF       _adc2+1 
;MyProject.c,35 :: 		temp2 = (adc2 * 500)/ 1024;   // Calculate equivalent value of LM35 temperature
	MOVLW       244
	MOVWF       R4 
	MOVLW       1
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       10
	MOVWF       R2 
	MOVF        R0, 0 
	MOVWF       _temp2+0 
	MOVF        R1, 0 
	MOVWF       _temp2+1 
	MOVF        R2, 0 
L__main8:
	BZ          L__main9
	RRCF        _temp2+1, 1 
	RRCF        _temp2+0, 1 
	BCF         _temp2+1, 7 
	BTFSC       _temp2+1, 6 
	BSF         _temp2+1, 7 
	ADDLW       255
	GOTO        L__main8
L__main9:
;MyProject.c,37 :: 		IntToStr (temp1 , txt);       // Convert numeric result of temperature to string to send it to PC
	MOVF        _temp1+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _temp1+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;MyProject.c,38 :: 		IntToStr (temp2 , txt);       // Convert numeric result of temperature to string to send it to PC
	MOVF        _temp2+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _temp2+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;MyProject.c,41 :: 		Uart1_write_Text ("Temp 1 = ");
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,42 :: 		Uart1_Write_Text (txt);
	MOVLW       _txt+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,43 :: 		Uart1_write_Text ("    &&     ");
	MOVLW       ?lstr2_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,44 :: 		Uart1_write_Text ("Temp 2 = ");
	MOVLW       ?lstr3_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,45 :: 		Uart1_Write_Text (txt);
	MOVLW       _txt+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,46 :: 		newline(); //One NewLine
	CALL        _newline+0, 0
;MyProject.c,48 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;MyProject.c,50 :: 		}
	GOTO        L_main0
;MyProject.c,52 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
