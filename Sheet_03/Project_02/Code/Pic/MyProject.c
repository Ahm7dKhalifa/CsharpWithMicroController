void newline()
{
  // The microsoft version of enter or new line is \r\n which is 0x0d 0x0a in hex.
  Uart1_write ('\r');      // \r is the carriage return
  Uart1_write ('\n');      // \n is the line feed

  //Uart1_write (0x0D);
  //Uart1_write (0x0A);
}
/////////////////////////////
//Define variables
//////////////////////////////
int adc1, adc2 , temp1, temp2;   // stores A/D value and temperature
char txt[7];                     // stores the string value of temperature

void main()
{
     ////////////////////////////////
     // input / output
     ////////////////////////////////
     TRISA = 0xff;   // Configure direction of ports
     ADCON1 = 0x80;  // Configure all pins of PORTA as A/D channels
     ////////////////////////////////
     // uart
     ////////////////////////////////
     uart1_Init (9600); // Initialize UART with baud rate = 9600

     for (;;)
      {

        adc1 = adc_read(0);           // Read temperature 1 from LM35 on AN0 of PORTA
        temp1 = (adc1 * 500)/ 1024;   // Calculate equivalent value of LM35 temperature

        adc2 = adc_read(1);           // Read temperature 2 from LM35 on AN1 of PORTA
        temp2 = (adc2 * 500)/ 1024;   // Calculate equivalent value of LM35 temperature

        IntToStr (temp1 , txt);       // Convert numeric result of temperature to string to send it to PC
        IntToStr (temp2 , txt);       // Convert numeric result of temperature to string to send it to PC
        
        // Send All Messages and end it with newLine
        Uart1_write_Text ("Temp 1 = ");
        Uart1_Write_Text (txt);
        Uart1_write_Text ("    &&     ");
        Uart1_write_Text ("Temp 2 = ");
        Uart1_Write_Text (txt);
        newline(); //One NewLine

        delay_ms(500);

      }

}