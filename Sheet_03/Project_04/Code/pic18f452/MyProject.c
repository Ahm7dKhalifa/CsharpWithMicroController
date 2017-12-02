void newline()
{
  // The microsoft version of enter or new line is \r\n which is 0x0d 0x0a in hex.
  Uart1_write ('\r');      // \r is the carriage return
  Uart1_write ('\n');      // \n is the line feed
}

/////////////////////////////////
// interrupt subroutine
/////////////////////////////////
void interrupt()
{
 ////////////////////////////////////////////////////////
 // if user pressed on increment button (interrupt INT0)
 /////////////////////////////////////////////////////////
 if(INT0IF_Bit==1)
 {
  // Send up count to PC and send newline
  Uart1_Write_Text("Up");
  PORTD = 0b00000001;
  Delay_ms(500);
  PORTD = 0b00000000;
  newline();
  INT0IF_Bit = 0;      // Clear INT0IF again to prevent recursive interrupt
 }
 ///////////////////////////////////////////////////////
 // if user pressed on DECREMENT button (interrupt INT1)
 /////////////////////////////////////////////////////////
 else if(INT1IF_Bit==1)
 {
  // Send down count to PC and send newline
  Uart1_Write_Text("Down");
  PORTD.F1 = 1;
  Delay_ms(500);
  PORTD.F1 = 0;
  newline();
  INT1IF_Bit = 0;      // Clear INT0IF again to prevent recursive interrupt
 }
}

void main()
{
 /////////////////////////////////////////
 // Configure of input/output
 /////////////////////////////////////////
 TRISB = 0xFF;   //button increment-button decrement as input
 TRISD = 0; //FOR LED
 /////////////////////////////////////////
 //  Configure interrupts
 /////////////////////////////////////////
 GIE_Bit = 1;       // Enable all interrupts

 INT0IE_Bit = 1;    // INT0 Interrupt Enable
 INT0IF_Bit = 0;    // INT0 Interrupt Flag

 INT1IE_Bit = 1;    // INT1 Interrupt Enable
 INT1IF_Bit = 0;    // INT1 Interrupt Flag
 ////////////////////////////////////////////
 //  Configure  UART
 ////////////////////////////////////////////
 UART1_Init (9600); // Initialize UART with baud rate = 9600

 while(1)
 {
  asm sleep;             // Make PIC 18F452 go to sleep until any interrupt occur and wake it up again
 }
}