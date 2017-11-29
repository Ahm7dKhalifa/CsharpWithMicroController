
int i = 0;              // loop identifier
// high interrupt subroutine
void interrupt()
{
    for(i=0; i<10; i++)     // 10 times OFF + 10 times ON  (Total= 10 times of flashing)
    {
     PORTC = ~PORTC;        // Toggle red leds on portc
     delay_ms(1000);
    }
    INTCON.INT0IF = 0;      // Clear INT0IF again to prevent recursive interrupt
}

// low interrupt subroutine
void interrupt_low()
{
   if(PORTD < 9 )
   {
       PORTD++;          // Display count on the 7-Seg display
   }
   else
   {
       PORTD = 0;
   }
   INTCON3.INT2IF = 0;     // Clear INT1IF again
}

void main() {
 TRISB = 0xFF;
 TRISC = 0;
 TRISD = 0;
 PORTC = 0;
 PORTD = 0;
 ///////////////////////////////////
 // INTERPUT CONFIG
 ///////////////////////////////////
 RCON.IPEN = 1; //interrupt priority enable
 INTCON.RBPU = 0;       // Enable pull up bit
 INTCON.GIEH = 1; //global interrupt enable  high priority
 INTCON.GIEL = 1; //global interrupt enable  low priority
 
 INTCON.INT0IE = 1; //int0 interrupt enable
 INTCON.INT0IF = 0; //int0 interrupt FLAG

 
 INTCON3.INT2IE = 1;  //int2 interrupt enable
 INTCON3.INT2IF = 0; //int2 interrupt FLAG
 INTCON3.INT2IP = 0; //int2 interrupt priority (LOW)
 
 INTCON2.INTEDG0 = 1;   // Configure INT0 for raising edge
 INTCON2.INTEDG2 = 0; //int2 edge
 asm sleep;
}