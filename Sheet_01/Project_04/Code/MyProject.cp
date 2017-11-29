#line 1 "D:/Programming/MicroControllerWithCsharp/Sheet_01/Project_04/Code/MyProject.c"
 unsigned int i = 0;
void interrupt()
{
 if( INTCON.INT0IF = 1)
 {
 for(i = 0; i<= 9; i++)
 {
 PORTC = 0xff;
 delay_ms(1000);
 PORTC = 0;
 delay_ms(1000);
 }
 }
 INTCON.INT0IF == 0;
}
void interrupt_low()
{
 if(INTCON3.INT2IF == 1)
 {
 if( PORTD <= 9 )
 {
 PORTD++;
 }
 else
 {
 PORTD = 0;
 }

 }
 INTCON3.INT2IF = 0;
}
void main() {
 TRISB = 0xFF;
 TRISC = 0;
 TRISD = 0;
 PORTC = 0;
 PORTD = 0;



 RCON.IPEN = 1;
 INTCON.GIEH = 1;
 INTCON.GIEL = 1;

 INTCON.INT0IE = 1;
 INTCON.INT0IF = 0;


 INTCON3.INT2IE = 1;
 INTCON3.INT2IF = 0;
 INTCON3.INT2IP = 0;
 INTCON2.INTEDG2 = 0;
 asm sleep;
}
