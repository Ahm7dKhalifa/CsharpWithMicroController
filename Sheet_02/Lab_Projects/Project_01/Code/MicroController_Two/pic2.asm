
_main:

;pic2.c,16 :: 		void main() {
;pic2.c,20 :: 		TRISB = 0;
	CLRF        TRISB+0 
;pic2.c,23 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;pic2.c,24 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;pic2.c,25 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;pic2.c,26 :: 		Lcd_Out(1,2,"Serial Comm ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_pic2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_pic2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;pic2.c,28 :: 		UART1_Init(9600);
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;pic2.c,31 :: 		for ( ; ; )
L_main0:
;pic2.c,34 :: 		if (Uart1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;pic2.c,37 :: 		i= Uart1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       main_i_L0+0 
;pic2.c,38 :: 		Lcd_Chr(2,8,i);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;pic2.c,39 :: 		i++;
	INCF        main_i_L0+0, 1 
;pic2.c,40 :: 		Uart1_Write (i);
	MOVF        main_i_L0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;pic2.c,41 :: 		}
L_main3:
;pic2.c,42 :: 		}
	GOTO        L_main0
;pic2.c,44 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
