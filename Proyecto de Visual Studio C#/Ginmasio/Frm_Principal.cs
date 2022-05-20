using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;



namespace Ginmasio
{
    public partial class Frm_Principal : Form
    {
        public Frm_Principal()
        {
            InitializeComponent();
        }

        Frm_Cliente Cliente;
       


        private void clientesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Cliente is null) //Esta condicion valida si ya existe una instancia del objeto Cliente, si no existe, simplemente la crea
            {
                Cliente = new Frm_Cliente();
                Cliente.Show();
            }
            else //En caso de que ya exista una instancia del objeto Cliente, cierra la anterior instancia y abre una nueva
            {
                Cliente.Close();
                 Cliente = new Frm_Cliente();
                //MessageBox.Show("YA ESTA ABIERTA LA VENTANA","ATENCION");
            }
            Cliente.MdiParent = this;

            Cliente.Show();



        }

        private void proovedoresToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void sALIRToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("¿ESTA SEGURO QUE DESEA SALIR", "ATENCION", MessageBoxButtons.YesNo,MessageBoxIcon.Question) == (System.Windows.Forms.DialogResult.Yes))
            {
                this.Close();
            }
        }

        private void PicLogo_Click(object sender, EventArgs e)
        {

        }

        private void registroToolStripMenuItem_Click(object sender, EventArgs e)
        {
           
        }
    }
}
