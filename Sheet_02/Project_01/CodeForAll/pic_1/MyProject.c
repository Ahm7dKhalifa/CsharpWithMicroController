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
////////////////////////////////////////////////
// Define variable
///////////////////////////////////////////////
unsigned char i;        // variable for transmitting UART data
unsigned char t;        // variable for receiving UART data

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
        Lcd_Out(1,2,"pic 1");
        /////////////////////////////////////////////////////////////
        // Initialize UART with a baud rate of 9600
        //////////////////////////////////////////////////////////////
        UART1_Init(9600);
        i = 'A';
         ///////////////////////////////////////////
        // For Error message
        Delay_ms(3000);
        //send 'a' for first time to  anthor pic
        Uart1_write (i);
        Delay_ms(20);
         /////////////////////////////////////////////////////////////
         // main program
         ////////////////////////////////////////////////////////////
         for ( ; ; )
           {
                  //recive data from anthor pic
                  if (Uart1_Data_Ready())
                  {
                                t = Uart1_Read();
                                //recived message
                                if( t == 'r' || t == 'R')
                                {
                                  Lcd_Cmd(_LCD_CLEAR);
                                  Lcd_Chr(2,8,t);
                                  i++;
                                  //send NEXT CHAR
                                  Uart1_write (i);
                                  Delay_ms(20);
                                }
                                //error message
                                if( t == 'e' || t == 'E')
                                {
                                  Lcd_Cmd(_LCD_CLEAR);
                                  Lcd_Chr(2,8,t);
                                  //send SAME CHAR
                                  Uart1_write (i);
                                  Delay_ms(20);
                                }
                   }

           }

}