/////////////////////////////////////////
// LCD configuration
////////////////////////////////////////
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
unsigned char TempC;
char TempC_text[10];

void main() {

        ///////////////////////////////////////////////////////////
        //  input - output confug
        ///////////////////////////////////////////////////////////
        TRISB = 0;          // make PORTB output for LCD
        TRISC.F7 = 1;       // make RX input
        TRISC.F6 = 0;       // make TX output
        /////////////////////////////////////////////////////////////
        // LCD commands
        /////////////////////////////////////////////////////////////
        Lcd_Init();
        Lcd_Cmd(_LCD_CLEAR);
        Lcd_Cmd(_LCD_CURSOR_OFF);
        Lcd_Out(1,2,"TEMP =");
        /////////////////////////////////////////////////////////////
        // Initialize UART with a baud rate of 9600
        //////////////////////////////////////////////////////////////
        UART1_Init(9600);
        Delay_ms(20);
         for ( ; ; )
           {
                      if (Uart1_Data_Ready())
                      {
                        t = Uart1_Read();
                        Lcd_Chr(2,8,t);
                        /*
                        i = Uart1_Read();
                        //floattostr(TempC,TempC_text);
                        lcd_chr(2,1,i);*/
                        Delay_ms(20);
                      }


           }

}