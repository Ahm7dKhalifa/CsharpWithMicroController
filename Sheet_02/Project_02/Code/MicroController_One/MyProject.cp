#line 1 "D:/Programming/MicroControllerWithCsharp/Sheet_02/Project_02/Code/MicroController_One/MyProject.c"



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



unsigned char i = 'a';
unsigned char t;

int adc1, temp1;
char txt[7];



void Interrupt(){
 if (TMR1IF_bit){
 TMR1IF_bit = 0;
 TMR1H = 0x3C;
 TMR1L = 0xAF;

 adc1 = adc_read(0);
 temp1 = (adc1 * 500)/ 1024;
 IntToStr (temp1 , txt);
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,2,"TempC =  ");
 Lcd_Out(2,1,txt);

 Uart1_write_Text("TempC = ");
 Uart1_write_Text(txt);
 Uart1_write_Text("OK");
 Uart1_write(i);
 i++;
 Delay_ms(300);
 }
 }
#line 56 "D:/Programming/MicroControllerWithCsharp/Sheet_02/Project_02/Code/MicroController_One/MyProject.c"
void main() {



 TRISB = 0;
 TRISC.F7 = 1;
 TRISC.F6 = 0;
 ADCON1 = 0x80;





 UART1_Init(9600);


 i = 'A';










 T1CON = 0x31;
 TMR1IF_bit = 0;
 TMR1H = 0x3C;
 TMR1L = 0xAF;
 TMR1IE_bit = 1;
 INTCON = 0xC0;



}
