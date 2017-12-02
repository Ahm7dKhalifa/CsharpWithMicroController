#line 1 "D:/Programming/MicroControllerWithCsharp/Sheet_03/Project_05/Code/pic18f452/MyProject.c"
unsigned int count = 0;
void newline()
{

 Uart1_write ('\r');
 Uart1_write ('\n');
}




void interrupt()
{



 if(INT0IF_Bit==1)
 {

 INT0IF_Bit=0;

 delay_ms(500);

 if(INT0IF_Bit==1)
 {

 Uart1_Write_Text("Down");
 PORTD.F1 = 1;
 Delay_ms(500);
 PORTD.F1 = 0;
 newline();
 INT0IF_Bit = 0;

 }

 else
 {
 Uart1_Write_Text("Up");
 PORTD = 0b00000001;
 Delay_ms(500);
 PORTD = 0b00000000;
 newline();
 INT0IF_Bit = 0;
 }


 }

}

void main()
{



 TRISB = 0xFF;
 TRISD = 0;



 GIE_Bit = 1;

 INT0IE_Bit = 1;
 INT0IF_Bit = 0;




 UART1_Init (9600);

 while(1)
 {
 asm sleep;
 }
}
