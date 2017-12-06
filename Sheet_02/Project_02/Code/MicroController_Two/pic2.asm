
_main:

;pic2.c,17 :: 		void main() {
;pic2.c,21 :: 		TRISB = 0;
	CLRF        TRISB+0 
;pic2.c,24 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;pic2.c,25 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;pic2.c,26 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;pic2.c,27 :: 		Lcd_Out(1,2,"Temp =  ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_pic2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_pic2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;pic2.c,29 :: 		UART1_Init(9600);
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;pic2.c,32 :: 		for ( ; ; )
L_main0:
;pic2.c,35 :: 		if (Uart1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;pic2.c,38 :: 		Uart1_Read_Text(&txt,"ok",17);
	MOVLW       _Txt+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_Txt+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       ?lstr2_pic2+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(?lstr2_pic2+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       17
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;pic2.c,39 :: 		Lcd_out(2,1,Txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _Txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_Txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;pic2.c,41 :: 		txt2 = Uart1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _txt2+0 
;pic2.c,42 :: 		Lcd_chr(2,1,txt2);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;pic2.c,44 :: 		}
L_main3:
;pic2.c,45 :: 		}
	GOTO        L_main0
;pic2.c,47 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
