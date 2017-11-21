void main() {
        //////////////////////////////////
        // input - output
        //////////////////////////////////
       //SWITCH SET TO INPUT
       TRISA.F4 = 1;
       // 7 SEG IS OUTPUT
       TRISB = 0;
        //////////////////////////////////////
        //Timer 0 Configration
        //////////////////////////////////////
       //Timer 0
       T0CON = 0b11111000;  //Falling edage
       ///////////////////////////////////////
       // program
       ///////////////////////////////////////
       //FOR LOOP TO REPEAT THE PROGRAM
       for(;;)
       {
          PORTB = TMR0L;
          if(TMR0L > 9)
          {
              TMR0L = 0;
          }
       }
}