

//define variables
//unsigned int adc_value;
//char adc_value_text[10];
//float TempC;
//char TempC_text[10];
unsigned char i;
void main() {
     //initalize adc
     ADC_Init();
     ADCON1 = 0b00000101;
     //INPUT-OUTPUT
     TRISA.b0 = 1;
      TRISC.F7 = 1;       // make RX input
      TRISC.F6 = 0;       // make TX output
        /////////////////////////////////////////////////////////////
        // Initialize UART with a baud rate of 9600
        //////////////////////////////////////////////////////////////
        UART1_Init(9600);

      do{
           adc_value = ADC_Read(0);
           TempC = adc_value * 1.5;
           TempC =  TempC / 1024;
           TempC =  TempC * 100;

            //send 'Temp' for  anthor pic
            Uart1_write (TempC);
            Delay_ms(20);




      }
      while(1);   */
}