/////////////////////////////////////////
// LCD configuration
////////////////////////////////////////
sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;
////////////////////////////////////////////////
// Define variable
///////////////////////////////////////////////
unsigned char i = 'a';        // variable for transmitting UART data
unsigned char t;        // variable for receiving UART data

int adc1,  temp1;   // stores A/D value and temperature
char txt[7];                     // stores the string value of temperature
///////////////////////////////////////////
//    Interrupt()
/////////////////////////////////////////
void Interrupt(){
  if (TMR1IF_bit){
    TMR1IF_bit = 0;
    TMR1H         = 0x3C;
    TMR1L         = 0xAF;
    //Enter your code here
     adc1 = adc_read(0);           // Read temperature 1 from LM35 on AN0 of PORTA
     temp1 = (adc1 * 500)/ 1024;   // Calculate equivalent value of LM35 temperature
     IntToStr (temp1 , txt);       // Convert numeric result of temperature to string to send it to PC
     Lcd_Init();
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Cmd(_LCD_CURSOR_OFF);
      Lcd_Out(1,2,"TempC =  ");
      Lcd_Out(2,1,txt);
      
      //Uart1_write_Text(txt);
        Uart1_write(i);
        i++;
      Delay_ms(300);
  }
 }
/***************************************************************
****************************************************************
                       main
***************************************************************
***************************************************************/
void main() {
        ///////////////////////////////////////////////////////////
        //  input - output confug
        ///////////////////////////////////////////////////////////
        TRISB = 0;          // make PORTB output for LCD
        TRISC.F7 = 1;       // make RX input
        TRISC.F6 = 0;       // make TX output
          ADCON1 = 0x80;  // Configure all pins of PORTA as A/D channels


        /////////////////////////////////////////////////////////////
        // Initialize UART with a baud rate of 9600
        //////////////////////////////////////////////////////////////
        UART1_Init(9600);

        //i = 0x41;
        i = 'A';
        //i = 65;
        
        //////////////////////////////////////////////////////
        //    Timer 1 config
        /////////////////////////////////////////////// /////
        //Timer1
        //Prescaler 1:8; TMR1 Preload = 15535; Actual Interrupt Time : 200 ms

        //Place/Copy this part in declaration section

          T1CON         = 0x31;
          TMR1IF_bit         = 0;
          TMR1H         = 0x3C;
          TMR1L         = 0xAF;
          TMR1IE_bit         = 1;
          INTCON         = 0xC0;



}