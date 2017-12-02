#line 1 "D:/Programming/MicroControllerWithCsharp/Sheet_02/Project_02/Project_01/MyCode/pic1/pic1.c"







unsigned char i;
void main() {





 TRISC.F7 = 1;
 TRISC.F6 = 0;



 UART1_Init(9600);
 Delay_ms(20);
 i = 'a';
 Uart1_write (i);
 Delay_ms(20);
#line 41 "D:/Programming/MicroControllerWithCsharp/Sheet_02/Project_02/Project_01/MyCode/pic1/pic1.c"
}
