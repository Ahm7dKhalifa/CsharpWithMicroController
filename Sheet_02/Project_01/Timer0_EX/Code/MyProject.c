void Interrupt(){
  //WHEN THE VALUE OF TMR0L + TMR0H = 65565 = 2^16
  //THIS HAPPEN AFTER 1 S
  if (TMR0IF_bit){
    //RESET
    TMR0IF_bit = 0;
    TMR0H = 0x0B;
    TMR0L = 0xDB;
    //Enter your code here
    PORTD = ~PORTD;
  }
}


void main() {
       //////////////////////////////////
       // input - output
       //////////////////////////////////
       //led SET TO Output
       TRISD = 0;
       //////////////////////////////////////
       //Timer 0 Configration
       //////////////////////////////////////
       //Timer 0
       T0CON = 0b10000100;//EnableTimer0-16-internal clock-donot care-presaclar enabled - 1:8 prescaler  or T0CON= 0x84;
       //initial value
       TMR0H	 = 0x0B;
       TMR0L	 = 0xDB;
       //ENABLE GLOBAL INTERRUPT
       GIE_bit	 = 1;
       //ENABLE TIMER0 INTERUPT
       TMR0IE_bit = 1;


}