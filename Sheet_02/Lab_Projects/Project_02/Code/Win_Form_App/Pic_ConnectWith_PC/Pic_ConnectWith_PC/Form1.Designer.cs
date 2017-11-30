namespace Pic_ConnectWith_PC
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.upBtn = new System.Windows.Forms.Button();
            this.downBtn = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // upBtn
            // 
            this.upBtn.BackColor = System.Drawing.Color.Black;
            this.upBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.upBtn.ForeColor = System.Drawing.Color.White;
            this.upBtn.Location = new System.Drawing.Point(90, 53);
            this.upBtn.Name = "upBtn";
            this.upBtn.Size = new System.Drawing.Size(114, 63);
            this.upBtn.TabIndex = 1;
            this.upBtn.Text = "UP";
            this.upBtn.UseVisualStyleBackColor = false;
            this.upBtn.Click += new System.EventHandler(this.upBtn_Click);
            // 
            // downBtn
            // 
            this.downBtn.BackColor = System.Drawing.Color.Red;
            this.downBtn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.downBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.downBtn.ForeColor = System.Drawing.Color.White;
            this.downBtn.Location = new System.Drawing.Point(90, 147);
            this.downBtn.Name = "downBtn";
            this.downBtn.Size = new System.Drawing.Size(114, 65);
            this.downBtn.TabIndex = 2;
            this.downBtn.Text = "Down";
            this.downBtn.UseVisualStyleBackColor = false;
            this.downBtn.Click += new System.EventHandler(this.downBtn_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::Pic_ConnectWith_PC.Properties.Resources._14079522_10153844662388575_4302206808297537587_n;
            this.pictureBox1.InitialImage = ((System.Drawing.Image)(resources.GetObject("pictureBox1.InitialImage")));
            this.pictureBox1.Location = new System.Drawing.Point(285, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(554, 399);
            this.pictureBox1.TabIndex = 3;
            this.pictureBox1.TabStop = false;
            this.pictureBox1.Click += new System.EventHandler(this.pictureBox1_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Red;
            this.label1.Location = new System.Drawing.Point(12, 317);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(246, 33);
            this.label1.TabIndex = 4;
            this.label1.Text = "Com Connection";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(842, 423);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.downBtn);
            this.Controls.Add(this.upBtn);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button upBtn;
        private System.Windows.Forms.Button downBtn;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label1;
    }
}

