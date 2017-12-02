#line 1 "D:/Programming/MicroControllerWithCsharp/Sheet_02/Project_02/ADCON_EX/Code/MyProject.c"

sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;


unsigned int adc_value;
char adc_value_text[10];
float TempC;
char TempC_text[10];

void main() {

 ADC_Init();
 ADCON1 = 0b00000101;

 TRISA.b0 = 1;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 do{
 adc_value = ADC_Read(0);
 TempC = adc_value * 1.5;
 TempC = TempC / 1024;
 TempC = TempC * 100;

 wordtostr( adc_value, adc_value_text);
 floattostr(TempC,TempC_text);
 lcd_out(1,1,adc_value_text);
 lcd_out(2,1,TempC_text);

 Delay_ms(1000);

 }
 while(1);
}
