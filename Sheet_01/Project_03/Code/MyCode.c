void main() {
        //////////////////////////////////
        // input - output
        //////////////////////////////////
        //SWITCH SET TO INPUT
        TRISA.F4 = 1;
        // 7 SEG IS OUTPUT
        TRISC = 0;
        TRISD = 0;
        PORTD = 0;
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
          PORTC = TMR0L;

          if(TMR0L == 9)
          {   //reset the first 7 segment when number of it > 9
              TMR0L = 0;
              //increment number in the second 7 segment when number of it < 9
              if(PORTD < 9)
              {
                PORTD ++;
              }
              //just count from 00 to 99
              else
              {
                  PORTD = 0;
              }
          }
       }
}