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

        //define g;obal variables
        SerialPort serialPort1;

        public Form1()
        {
            InitializeComponent();
            //GET all names of serial ports in the pc and add Them to combobox
            getAvailablePorts();
        }

        void getAvailablePorts()
        {
            //GET all names of serial ports
            string[] ports = SerialPort.GetPortNames();
            //add Them to combobox
            comboBox1.Items.AddRange(ports);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                //get name of the port whuch selected in combobox
                String t = comboBox1.Text.ToString();
                richTextBox1.ScrollToCaret();
                //create connection with the port selected
                serialPort1 = new SerialPort(t, 9600, Parity.None, 8, StopBits.One);
                //open the port
                serialPort1.Open();
                //call this function when the selected port recived data
                serialPort1.DataReceived += new SerialDataReceivedEventHandler(DataReceivedHandler);

                label4.Text = "Data Recived....";
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
            // first message from an0
            ////////////////////////////////////////////
            //store the recived data in w 
            String w = serialPort1.ReadLine();
            if (w != string.Empty)
            {
                //richTextBox1.Text += w;
                Invoke(new Action(() => richTextBox1.Text += w));
                Invoke(new Action(() => richTextBox1.AppendText(w)));
                Invoke(new Action(() => richTextBox1.ScrollToCaret()));
            }
            else
            {
                w = "Waiting to Recive Data From AN0";
                Invoke(new Action(() => richTextBox1.Text += w));
                Invoke(new Action(() => richTextBox1.AppendText(w)));
                Invoke(new Action(() => richTextBox1.ScrollToCaret()));
            }
            ////////////////////////////////////////////
            // Second message from an1
            ////////////////////////////////////////////
            w = serialPort1.ReadLine();
            if (w != string.Empty)
            {
                Invoke(new Action(() => richTextBox2.Text += w));
                Invoke(new Action(() => richTextBox2.AppendText(w)));

                Invoke(new Action(() => richTextBox2.ScrollToCaret()));
            }
            else
            {
                w = "Waiting to Recive Data From AN1";
                Invoke(new Action(() => richTextBox2.Text += w));
                Invoke(new Action(() => richTextBox2.AppendText(w)));
                Invoke(new Action(() => richTextBox2.ScrollToCaret()));
            }
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}
