// LCD configuration
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

unsigned char i;        // variable for lcd
 void Interrupt(){
  //WHEN THE VALUE OF TMR0L + TMR0H = 65565 = 2^16
  //THIS HAPPEN AFTER 1 S
  if (TMR0IF_bit){
    //RESET
    TMR0IF_bit = 0;
    TMR0H = 0x0B;
    TMR0L = 0xDB;
    //Enter your code here
    // receive data
    if (Uart1_Data_Ready())
    {
            // if data is received, display it and send the next character
            i= Uart1_Read();
            // LCD commands
            Lcd_Init();
            Lcd_Cmd(_LCD_CLEAR);
            Lcd_Cmd(_LCD_CURSOR_OFF);
            Lcd_Chr(2,8,i);
            Delay_ms(20);
            Uart1_write ('R');
            Delay_ms(20);
    }
    else
    {
             Uart1_write ('E');
             Delay_ms(20);
    }

  }
}

void main() {


        TRISB = 0;



         UART1_Init(9600);
         Delay_ms(20);
        // Initialize UART with a baud rate of 9600

         //Timer 0 Configration
       //////////////////////////////////////
       //Timer 0
       T0CON = 0b10000100;//EnableTimer0-16-internal clock-donot care-presaclar enabled - 1:8 prescaler  or T0CON= 0x84;
       //initial value
       TMR0H         = 0x0B;
       TMR0L         = 0xDB;
       //ENABLE GLOBAL INTERRUPT
       GIE_bit         = 1;
       //ENABLE TIMER0 INTERUPT
       TMR0IE_bit = 1;
}