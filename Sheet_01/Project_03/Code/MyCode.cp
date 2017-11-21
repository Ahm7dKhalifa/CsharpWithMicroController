#line 1 "D:/Programming/MicroControllerWithCsharp/Sheet_01/Project_03/Code/MyCode.c"
void main() {




 TRISA.F4 = 1;

 TRISC = 0;
 TRISD = 0;
 PORTD = 0;




 T0CON = 0b11111000;





 for(;;)
 {
 PORTC = TMR0L;

 if(TMR0L == 9)
 {
 TMR0L = 0;

 if(PORTD < 9)
 {
 PORTD ++;
 }

 else
 {
 PORTD = 0;
 }
 }
 }
}
