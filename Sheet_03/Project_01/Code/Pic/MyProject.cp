#line 1 "D:/Programming/MicroControllerWithCsharp/Sheet_03/Project_01/Code/Pic/MyProject.c"
void newline()
{

 Uart1_write ('\r');
 Uart1_write ('\n');



}

int adc1, adc2 , temp1, temp2;
char txt[7];

void main()
{
 TRISA = 0xff;
 ADCON1 = 0x80;

 uart1_Init (9600);

 for (;;)
 {
 adc1 = adc_read(0);
 temp1 = (adc1 * 500)/ 1024;

 adc2 = adc_read(1);
 temp2 = (adc2 * 500)/ 1024;

 IntToStr (temp1 , txt);



 Uart1_write_Text ("Temp 1 = ");
 Uart1_Write_Text (txt);
 newline();

 IntToStr (temp2 , txt);



 Uart1_write_Text ("Temp 2 = ");
 Uart1_Write_Text (txt);
 newline();

 delay_ms(500);

 }

}
