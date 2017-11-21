#line 1 "D:/Programming/MicroControllerWithCsharp/Sheet_01/Project_02/Code/MyCode.c"
void main() {




 TRISA.F4 = 1;

 TRISB = 0;




 T0CON = 0b11111000;




 for(;;)
 {
 PORTB = TMR0L;
 if(TMR0L > 9)
 {
 TMR0L = 0;
 }
 }
}
