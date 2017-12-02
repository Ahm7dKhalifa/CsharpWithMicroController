
_main:

;MyProject.c,22 :: 		void main() {
;MyProject.c,24 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;MyProject.c,25 :: 		ADCON1 = 0b00000101;
	MOVLW       5
	MOVWF       ADCON1+0 
;MyProject.c,27 :: 		TRISA.b0 = 1;
	BSF         TRISA+0, 0 
;MyProject.c,29 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MyProject.c,30 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,31 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,32 :: 		do{
L_main0:
;MyProject.c,33 :: 		adc_value = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adc_value+0 
	MOVF        R1, 0 
	MOVWF       _adc_value+1 
;MyProject.c,34 :: 		TempC = adc_value * 1.5;
	CALL        _Word2Double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       64
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _TempC+0 
	MOVF        R1, 0 
	MOVWF       _TempC+1 
	MOVF        R2, 0 
	MOVWF       _TempC+2 
	MOVF        R3, 0 
	MOVWF       _TempC+3 
;MyProject.c,35 :: 		TempC =  TempC / 1024;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       137
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _TempC+0 
	MOVF        R1, 0 
	MOVWF       _TempC+1 
	MOVF        R2, 0 
	MOVWF       _TempC+2 
	MOVF        R3, 0 
	MOVWF       _TempC+3 
;MyProject.c,36 :: 		TempC =  TempC * 100;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _TempC+0 
	MOVF        R1, 0 
	MOVWF       _TempC+1 
	MOVF        R2, 0 
	MOVWF       _TempC+2 
	MOVF        R3, 0 
	MOVWF       _TempC+3 
;MyProject.c,38 :: 		wordtostr( adc_value, adc_value_text);
	MOVF        _adc_value+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        _adc_value+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _adc_value_text+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_adc_value_text+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;MyProject.c,39 :: 		floattostr(TempC,TempC_text);
	MOVF        _TempC+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _TempC+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _TempC+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _TempC+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _TempC_text+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_TempC_text+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;MyProject.c,40 :: 		lcd_out(1,1,adc_value_text);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _adc_value_text+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_adc_value_text+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,41 :: 		lcd_out(2,1,TempC_text);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _TempC_text+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_TempC_text+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,43 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
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
;MyProject.c,46 :: 		while(1);
	GOTO        L_main0
;MyProject.c,47 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
