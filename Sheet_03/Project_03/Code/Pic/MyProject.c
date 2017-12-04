void newline()
{
  // The microsoft version of enter or new line is \r\n which is 0x0d 0x0a in hex.
  Uart1_write ('\r');      // \r is the carriage return
  Uart1_write ('\n');      // \n is the line feed

  //Uart1_write (0x0D);
  //Uart1_write (0x0A);
}
///////////////////////////
//Define Global variabls
//////////////////////////
int adc1, adc2 , temp1, temp2;   // stores A/D value and temperature
char txt[7];                     // stores the string value of temperature

void main()
{
     ////////////////////////////////////
     //input/output
     ////////////////////////////////////
     TRISB = 0xff;   // Configure direction of ports
     ///////////////////////////////////
     // uart
     ////////////////////////////////////
     uart1_Init (9600); // Initialize UART with baud rate = 9600

     for (;;)
      {
      
        //Switch 0
        if(PORTB.F0 == 1)
        {
            Uart1_write_Text (" Open");
            newline();
        }
        else
        {
            Uart1_write_Text (" Closed");
            newline();
        }
        
        //Switch 1
        if(PORTB.F1 == 1)
        {
            Uart1_write_Text (" Open ");
            newline();
        }
        else
        {
            Uart1_write_Text (" Closed ");
            newline();
        }
      
        //Switch 2
        if(PORTB.F2 == 1)
        {
            Uart1_write_Text (" Open ");
            newline();
        }
        else
        {
            Uart1_write_Text (" Closed ");
            newline();
        }
        
        //Switch 3
        if(PORTB.F3 == 1)
        {
            Uart1_write_Text (" Open ");
            newline();
        }
        else
        {
            Uart1_write_Text (" Closed ");
            newline();
        }
      
        //Switch 4
        if(PORTB.F4 == 1)
        {
            Uart1_write_Text (" Open ");
            newline();
        }
        else
        {
            Uart1_write_Text (" Closed ");
            newline();
        }
        
        //Switch 5
        if(PORTB.F5 == 1)
        {
            Uart1_write_Text (" Open ");
            newline();
        }
        else
        {
            Uart1_write_Text (" Closed ");
            newline();
        }
      
        //Switch 6
        if(PORTB.F6 == 1)
        {
            Uart1_write_Text (" Open ");
            newline();
        }
        else
        {
            Uart1_write_Text (" Closed ");
            newline();
        }

        //Switch 7
        if(PORTB.F7 == 1)
        {
            Uart1_write_Text (" Open ");
            newline();
        }
        else
        {
            Uart1_write_Text (" Closed ");
            newline();
        }
        delay_ms(500);

      }

}