using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
//Name Space for Serial port
using System.IO.Ports;
namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        //define global variables
        SerialPort serialPort1;

        public Form1()
        {
            InitializeComponent();
            try
            {
                //create connection with the port selected
                serialPort1 = new SerialPort("COM1", 9600, Parity.None, 8, StopBits.One);
                //open the port
                serialPort1.Open();
                // call this function when the selected port recived data
                serialPort1.DataReceived += new SerialDataReceivedEventHandler(DataReceivedHandler);
            }
            catch
            {
                label4.Text = "This Port Is Not Connected With PIC ";
            }
        }

        private void DataReceivedHandler(object sender, SerialDataReceivedEventArgs e)
        {
            //cast
            serialPort1 = (SerialPort)sender;
            ////////////////////////////////////////////
            // read all messages
            ////////////////////////////////////////////
            //Switch0
            String Switch0 = serialPort1.ReadLine();
            if (Switch0 != string.Empty)
            {

                Invoke(new Action(() => label9.Text = Switch0));
            }
            else
            {
                Switch0 = "Waiting to Recive Data From Switch1";
                Invoke(new Action(() => label9.Text = Switch0));
            }
            //Switch1
            String Switch1 = serialPort1.ReadLine();
            if (Switch1 != string.Empty)
            {

                Invoke(new Action(() => label10.Text = Switch1));
            }
            else
            {
                Switch1 = "Waiting to Recive Data From Switch1";
                Invoke(new Action(() => label10.Text = Switch1));
            }
            //Switch2
            String Switch2 = serialPort1.ReadLine();
            if (Switch2 != string.Empty)
            {

                Invoke(new Action(() => label11.Text = Switch2));
            }
            else
            {
                Switch2 = "Waiting to Recive Data From Switch2";
                Invoke(new Action(() => label11.Text = Switch2));
            }
            //Switch3
            String Switch3 = serialPort1.ReadLine();
            if (Switch3 != string.Empty)
            {

                Invoke(new Action(() => label12.Text = Switch3));
            }
            else
            {
                Switch3 = "Waiting to Recive Data From Switch3";
                Invoke(new Action(() => label12.Text = Switch3));
            }
            //Switch4
            String Switch4= serialPort1.ReadLine();
            if (Switch4 != string.Empty)
            {

                Invoke(new Action(() => label13.Text = Switch4));
            }
            else
            {
                Switch4 = "Waiting to Recive Data From Switch4";
                Invoke(new Action(() => label13.Text = Switch4));
            }
            //Switch5
            String Switch5 = serialPort1.ReadLine();
            if (Switch5 != string.Empty)
            {

                Invoke(new Action(() => label14.Text = Switch5));
            }
            else
            {
                Switch5 = "Waiting to Recive Data From Switch5";
                Invoke(new Action(() => label14.Text = Switch5));
            }
            //Switch6
            String Switch6 = serialPort1.ReadLine();
            if (Switch6 != string.Empty)
            {

                Invoke(new Action(() => label15.Text = Switch6));
            }
            else
            {
                Switch6 = "Waiting to Recive Data From Switch6";
                Invoke(new Action(() => label15.Text = Switch6));
            }
            //Switch7
            String Switch7 = serialPort1.ReadLine();
            if (Switch7 != string.Empty)
            {

                Invoke(new Action(() => label16.Text = Switch7));
            }
            else
            {
                Switch7 = "Waiting to Recive Data From Switch7";
                Invoke(new Action(() => label16.Text = Switch7));
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}
