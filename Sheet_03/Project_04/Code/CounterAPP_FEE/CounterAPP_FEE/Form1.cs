using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
//name space for serial communication
using System.IO.Ports;

namespace CounterAPP_FEE
{
    public partial class Form1 : Form
    {
        //Create Connecation With Port COM2 
        SerialPort port = new SerialPort("COM1", 9600, Parity.None, 8, StopBits.One);
        //Default Count
        int count = 0;

        public Form1()
        {
            InitializeComponent();
            //open port to send or recive data
            port.Open();
            //this function invoked when data recived from port COM2
            port.DataReceived += new SerialDataReceivedEventHandler(DataReceivedHandler);
        }

        private void DataReceivedHandler(object sender, SerialDataReceivedEventArgs e)
        {
            //Cast Parameter
            port = (SerialPort)sender;
            //Store The Recived Data to W
            String w = port.ReadLine();
            //if(String.Equals(w, "Up"))
            if (String.Compare(w, "Up") == 1)
            {
                //Increment Counter 
                count++;
                //display counter on label2
                Invoke(new Action(() => label2.Text = count.ToString()));
            }
            else if (String.Compare(w, "Down") == 1)
            {
                //decrement Counter
                count--;
                //display counter on label2
                Invoke(new Action(() => label2.Text = count.ToString()));
            }
        }
    }
}
