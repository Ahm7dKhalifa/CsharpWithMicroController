#line 1 "D:/Programming/MicroControllerWithCsharp/Sheet_02/Lab_Projects/Project_01/Code/MicroController_One/MyProject.c"



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



unsigned char i;
unsigned char t;
#line 27 "D:/Programming/MicroControllerWithCsharp/Sheet_02/Lab_Projects/Project_01/Code/MicroController_One/MyProject.c"
void main() {



 TRISB = 0;
 TRISC.F7 = 1;
 TRISC.F6 = 0;




 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,2,"Serial Comm ");





 UART1_Init(9600);


 i = 'A';





 for ( ; ; )
 {




 while (PORTC.F0 !=0);




 Uart1_write (i);
 Delay_ms(20);

 if (Uart1_Data_Ready())
 {


 t = Uart1_Read();
 Lcd_Chr(2,8,t);
 i++;

 while (PORTC.F0 == 0);

 }

 }

}
