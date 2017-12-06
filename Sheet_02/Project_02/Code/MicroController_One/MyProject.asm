
_Interrupt:

;MyProject.c,28 :: 		void Interrupt(){
;MyProject.c,29 :: 		if (TMR1IF_bit){
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_Interrupt0
;MyProject.c,30 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;MyProject.c,31 :: 		TMR1H         = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;MyProject.c,32 :: 		TMR1L         = 0xAF;
	MOVLW       175
	MOVWF       TMR1L+0 
;MyProject.c,34 :: 		adc1 = adc_read(0);           // Read temperature 1 from LM35 on AN0 of PORTA
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adc1+0 
	MOVF        R1, 0 
	MOVWF       _adc1+1 
;MyProject.c,35 :: 		temp1 = (adc1 * 500)/ 1024;   // Calculate equivalent value of LM35 temperature
	MOVLW       244
	MOVWF       R4 
	MOVLW       1
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVF        R0, 0 
	MOVWF       R2 
	MOVF        R1, 0 
	MOVWF       R3 
	MOVF        R4, 0 
L__Interrupt4:
	BZ          L__Interrupt5
	RRCF        R3, 1 
	RRCF        R2, 1 
	BCF         R3, 7 
	BTFSC       R3, 6 
	BSF         R3, 7 
	ADDLW       255
	GOTO        L__Interrupt4
L__Interrupt5:
	MOVF        R2, 0 
	MOVWF       _temp1+0 
	MOVF        R3, 0 
	MOVWF       _temp1+1 
;MyProject.c,36 :: 		IntToStr (temp1 , txt);       // Convert numeric result of temperature to string to send it to PC
	MOVF        R2, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R3, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;MyProject.c,37 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MyProject.c,38 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,39 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,40 :: 		Lcd_Out(1,2,"TempC =  ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,41 :: 		Lcd_Out(2,1,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,43 :: 		Uart1_write_Text("TempC = ");
	MOVLW       ?lstr2_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,44 :: 		Uart1_write_Text(txt);
	MOVLW       _txt+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,45 :: 		Uart1_write_Text("OK");
	MOVLW       ?lstr3_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,46 :: 		Uart1_write(i);
	MOVF        _i+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,47 :: 		i++;
	INCF        _i+0, 1 
;MyProject.c,48 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_Interrupt1:
	DECFSZ      R13, 1, 1
	BRA         L_Interrupt1
	DECFSZ      R12, 1, 1
	BRA         L_Interrupt1
	DECFSZ      R11, 1, 1
	BRA         L_Interrupt1
	NOP
	NOP
;MyProject.c,49 :: 		}
L_Interrupt0:
;MyProject.c,50 :: 		}
L_end_Interrupt:
L__Interrupt3:
	RETFIE      1
; end of _Interrupt

_main:

;MyProject.c,56 :: 		void main() {
;MyProject.c,60 :: 		TRISB = 0;          // make PORTB output for LCD
	CLRF        TRISB+0 
;MyProject.c,61 :: 		TRISC.F7 = 1;       // make RX input
	BSF         TRISC+0, 7 
;MyProject.c,62 :: 		TRISC.F6 = 0;       // make TX output
	BCF         TRISC+0, 6 
;MyProject.c,63 :: 		ADCON1 = 0x80;  // Configure all pins of PORTA as A/D channels
	MOVLW       128
	MOVWF       ADCON1+0 
;MyProject.c,69 :: 		UART1_Init(9600);
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MyProject.c,72 :: 		i = 'A';
	MOVLW       65
	MOVWF       _i+0 
;MyProject.c,83 :: 		T1CON         = 0x31;
	MOVLW       49
	MOVWF       T1CON+0 
;MyProject.c,84 :: 		TMR1IF_bit         = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;MyProject.c,85 :: 		TMR1H         = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;MyProject.c,86 :: 		TMR1L         = 0xAF;
	MOVLW       175
	MOVWF       TMR1L+0 
;MyProject.c,87 :: 		TMR1IE_bit         = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;MyProject.c,88 :: 		INTCON         = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;MyProject.c,92 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
