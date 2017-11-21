#line 1 "D:/labs/Ahmed/Sheet_01/MyCode.c"
void main() {




 TRISA.F4 = 1;

 TRISB = 0;




 T0CON = 0b11101000;




 for(;;)
 {
 PORTB = TMR0L;
 if(TMR0L > 9)
 {
 TMR0L = 0;
 }
 }
}
