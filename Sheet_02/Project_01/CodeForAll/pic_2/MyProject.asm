
_Interrupt:

;MyProject.c,17 :: 		void Interrupt(){
;MyProject.c,20 :: 		if (TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_Interrupt0
;MyProject.c,22 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;MyProject.c,23 :: 		TMR0H = 0x0B;
	MOVLW       11
	MOVWF       TMR0H+0 
;MyProject.c,24 :: 		TMR0L = 0xDB;
	MOVLW       219
	MOVWF       TMR0L+0 
;MyProject.c,27 :: 		if (Uart1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Interrupt1
;MyProject.c,30 :: 		i= Uart1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _i+0 
;MyProject.c,32 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MyProject.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,35 :: 		Lcd_Chr(2,8,i);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _i+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;MyProject.c,36 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_Interrupt2:
	DECFSZ      R13, 1, 1
	BRA         L_Interrupt2
	DECFSZ      R12, 1, 1
	BRA         L_Interrupt2
	NOP
	NOP
;MyProject.c,37 :: 		Uart1_write ('R');
	MOVLW       82
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,38 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_Interrupt3:
	DECFSZ      R13, 1, 1
	BRA         L_Interrupt3
	DECFSZ      R12, 1, 1
	BRA         L_Interrupt3
	NOP
	NOP
;MyProject.c,39 :: 		}
	GOTO        L_Interrupt4
L_Interrupt1:
;MyProject.c,42 :: 		Uart1_write ('E');
	MOVLW       69
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,43 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_Interrupt5:
	DECFSZ      R13, 1, 1
	BRA         L_Interrupt5
	DECFSZ      R12, 1, 1
	BRA         L_Interrupt5
	NOP
	NOP
;MyProject.c,44 :: 		}
L_Interrupt4:
;MyProject.c,46 :: 		}
L_Interrupt0:
;MyProject.c,47 :: 		}
L_end_Interrupt:
L__Interrupt8:
	RETFIE      1
; end of _Interrupt

_main:

;MyProject.c,49 :: 		void main() {
;MyProject.c,52 :: 		TRISB = 0;
	CLRF        TRISB+0 
;MyProject.c,56 :: 		UART1_Init(9600);
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MyProject.c,57 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	NOP
	NOP
;MyProject.c,63 :: 		T0CON = 0b10000100;//EnableTimer0-16-internal clock-donot care-presaclar enabled - 1:8 prescaler  or T0CON= 0x84;
	MOVLW       132
	MOVWF       T0CON+0 
;MyProject.c,65 :: 		TMR0H         = 0x0B;
	MOVLW       11
	MOVWF       TMR0H+0 
;MyProject.c,66 :: 		TMR0L         = 0xDB;
	MOVLW       219
	MOVWF       TMR0L+0 
;MyProject.c,68 :: 		GIE_bit         = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;MyProject.c,70 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;MyProject.c,71 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
