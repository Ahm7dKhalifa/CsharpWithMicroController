#line 1 "D:/Programming/MicroControllerWithCsharp/Sheet_02/Lab_Projects/Project_02/Code/Pic/MyCode.c"

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

unsigned char uart_rd;
int cnt = 0;

void main()
{
 ADCON1 = 0X07;
 TRISA=0xFF;
 TRISB = TRISD = 0;
 TRISC.B7 = 1;
 TRISC.B6 = 0;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 LCD_out (1,1,"Serial PC 7Seg");

 uart1_init(9600);
 delay_ms(50);

 for ( ; ; )
 {
 if(uart1_data_ready())
 {
 uart_rd = uart1_read();
 if (uart_rd == 'u'||uart_rd == 'U')
 {
 cnt++;
 if(cnt > 5) cnt = 0;
 portd = cnt;

 porta.b0 = 1;
 porta.b1 = 0;
 lcd_out (2,1,"  Counter  UP    ");
 }
 else if (uart_rd == 'd'||uart_rd == 'D')
 {
 cnt--;
 if(cnt < 0) cnt = 5;
 portd = cnt;

 porta.b0 = 0;
 porta.b1 = 1;
 lcd_out (2,1,"  Counter Down   ");
 }
 }
 }
}
