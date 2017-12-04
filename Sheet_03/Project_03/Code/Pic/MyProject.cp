#line 1 "D:/Programming/MicroControllerWithCsharp/Sheet_03/Project_03/Code/Pic/MyProject.c"
void newline()
{

 Uart1_write ('\r');
 Uart1_write ('\n');



}



int adc1, adc2 , temp1, temp2;
char txt[7];

void main()
{



 TRISB = 0xff;



 uart1_Init (9600);

 for (;;)
 {


 if(PORTB.F0 == 1)
 {
 Uart1_write_Text (" Open");
 newline();
 }
 else
 {
 Uart1_write_Text (" Closed");
 newline();
 }


 if(PORTB.F1 == 1)
 {
 Uart1_write_Text (" Open ");
 newline();
 }
 else
 {
 Uart1_write_Text (" Closed ");
 newline();
 }


 if(PORTB.F2 == 1)
 {
 Uart1_write_Text (" Open ");
 newline();
 }
 else
 {
 Uart1_write_Text (" Closed ");
 newline();
 }


 if(PORTB.F3 == 1)
 {
 Uart1_write_Text (" Open ");
 newline();
 }
 else
 {
 Uart1_write_Text (" Closed ");
 newline();
 }


 if(PORTB.F4 == 1)
 {
 Uart1_write_Text (" Open ");
 newline();
 }
 else
 {
 Uart1_write_Text (" Closed ");
 newline();
 }


 if(PORTB.F5 == 1)
 {
 Uart1_write_Text (" Open ");
 newline();
 }
 else
 {
 Uart1_write_Text (" Closed ");
 newline();
 }


 if(PORTB.F6 == 1)
 {
 Uart1_write_Text (" Open ");
 newline();
 }
 else
 {
 Uart1_write_Text (" Closed ");
 newline();
 }


 if(PORTB.F7 == 1)
 {
 Uart1_write_Text (" Open ");
 newline();
 }
 else
 {
 Uart1_write_Text (" Closed ");
 newline();
 }
 delay_ms(500);

 }

}
