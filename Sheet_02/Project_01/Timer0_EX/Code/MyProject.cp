#line 1 "D:/Programming/MicroControllerWithCsharp/Sheet_02/Project_01/Timer0_EX/Code/MyProject.c"
void Interrupt(){


 if (TMR0IF_bit){

 TMR0IF_bit = 0;
 TMR0H = 0x0B;
 TMR0L = 0xDB;

 PORTD = ~PORTD;
 }
}


void main() {




 TRISD = 0;




 T0CON = 0b10000100;

 TMR0H = 0x0B;
 TMR0L = 0xDB;

 GIE_bit = 1;

 TMR0IE_bit = 1;


}
