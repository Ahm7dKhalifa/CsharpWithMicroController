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
  char Txt[7];        // variable for lcd
 unsigned char txt2;        // variable for lcd
void main() {



        TRISB = 0;

        // LCD commands
        Lcd_Init();
        Lcd_Cmd(_LCD_CLEAR);
        Lcd_Cmd(_LCD_CURSOR_OFF);
        Lcd_Out(1,2,"Temp =  ");

        UART1_Init(9600);
        // Initialize UART with a baud rate of 9600

        for ( ; ; )
        {
                // receive data
                if (Uart1_Data_Ready())
                {
                        // if data is received,
                        /*
                        txt = Uart1_Read_Text();
                        Lcd_out(2,1,Txt);
                        */
                         txt2 = Uart1_Read();
                         Lcd_chr(2,1,txt2);

                }
        }

}