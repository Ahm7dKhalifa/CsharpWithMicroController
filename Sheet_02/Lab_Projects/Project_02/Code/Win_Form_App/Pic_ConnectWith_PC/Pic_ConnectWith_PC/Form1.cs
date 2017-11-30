using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports;

namespace Pic_ConnectWith_PC
{
    public partial class Form1 : Form
    {
        //connect pc with pic
        SerialPort port = new SerialPort("COM1", 9600, Parity.None, 8, StopBits.One);

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void upBtn_Click(object sender, EventArgs e)
        {
            try
            {
                port.Open();
                port.Write("u");
                port.Close();
            }
            catch
            {
                label1.Text = "com1 is not exist";
            }

        }

        private void downBtn_Click(object sender, EventArgs e)
        {
            port.Open();
            port.Write("d");
            port.Close();
        }

       

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
