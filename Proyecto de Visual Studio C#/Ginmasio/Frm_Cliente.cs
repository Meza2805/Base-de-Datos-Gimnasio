using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Capa_Negocio;

namespace Ginmasio
{
    public partial class Frm_Cliente : Form
    {
        CRUD_Cliente CCliente = new CRUD_Cliente();
        //Variables Goblales********************************************
        public static String Cedula, PNombre, SNombre, PApellido, SApellido, Fecha_Nac;
        char sexo_char;
        //**************************************************************


        public Frm_Cliente()
        {
            InitializeComponent();
            llenar_cb();
            mostrar_clientes();
            limpiar_texbox();
            Cantidad_Cliente();
            
        }


        //Metodos implementados************************************************
        //*********************************************************************
        public void llenar_cb()
        {
            cbSexo.Text = "SEXO";
            cbSexo.Items.Add("--------------");
            cbSexo.Items.Add("FEMENINO");
            cbSexo.Items.Add("MASCULINO");
        }

        public void mostrar_clientes()
        {

            DgvCliente.DataSource = CCliente.Mostrar_Cliente();
          
        }

        public void limpiar_texbox()
        {
            txtCedula.Clear();
            txtPrimer_Nombre.Clear();
            txtSegundo_Nombre.Clear();
            txtPrimerApellido.Clear();
            txtSegundoApellido.Clear();
            DateTime fecha = DateTime.Now;
            DtpFecha_Nac.Text = fecha.ToShortDateString();
            cbSexo.SelectedIndex = 0;
            txtFechaRegistro.Clear();
            txtEstado.Clear();
            txtCedula.BackColor = Color.White;
            txtPrimer_Nombre.BackColor = Color.White;
            txtPrimerApellido.BackColor = Color.White;
        }

        public void DgvCliente_SelectionChanged(object sender, EventArgs e)  //metodo para colocar los datos de la tabla en los textboxs
        {
            try
            {
                string sexo, f;
                DateTime fecha_nac;
                txtCedula.Text = DgvCliente.CurrentRow.Cells[0].Value.ToString();
                txtPrimer_Nombre.Text = DgvCliente.CurrentRow.Cells[1].Value.ToString();
                txtSegundo_Nombre.Text = DgvCliente.CurrentRow.Cells[2].Value.ToString();
                txtPrimerApellido.Text = DgvCliente.CurrentRow.Cells[3].Value.ToString();
                txtSegundoApellido.Text = DgvCliente.CurrentRow.Cells[4].Value.ToString();
                sexo = DgvCliente.CurrentRow.Cells[5].Value.ToString();
                if (sexo.Equals("F"))
                {
                    cbSexo.SelectedIndex = 1;
                }
                else
                {
                    cbSexo.SelectedIndex = 2;
                }
                //txtFechaNac.Text = DgvCliente.CurrentRow.Cells[7].Value.ToString();
                txtFechaRegistro.Text = DgvCliente.CurrentRow.Cells[6].Value.ToString();
                f = DgvCliente.CurrentRow.Cells[7].Value.ToString();
                fecha_nac = Convert.ToDateTime(f);
                DtpFecha_Nac.Text = fecha_nac.ToShortDateString();
                txtEstado.Text = DgvCliente.CurrentRow.Cells[8].Value.ToString();
            }
            catch (NullReferenceException)
            {
                MessageBox.Show("INDICE INVALIDO", "ERROR");
                mostrar_clientes();
            }
        }

        public Boolean validar_Espacios_vacios() //Metodo para validar que los campos importantes no estan vacios
        {
            Boolean band = true;
            if (txtCedula.Text.Length < 16)
            {
                band = false;
                Error_Provider.SetError(txtCedula, "Cedula Incompleta o Espacio vacio");
            }
            if (txtPrimer_Nombre.Text.Length == 0)
            {
                band = false;
                Error_Provider.SetError(txtPrimer_Nombre,"Este campo no puede estar vacio");
            }
            if (txtPrimerApellido.Text.Length == 0)
            {
                band = false;
                Error_Provider.SetError(txtPrimerApellido, "Este campo no puede estar vacio");
            }
            if (cbSexo.SelectedIndex == 0)
            {
                Error_Provider.SetError(cbSexo,"Seleccione un Sexo");
                band = false;
            }
                DateTime fecha = DateTime.Now;
            if (DtpFecha_Nac.Text == fecha.ToShortDateString())
            {
                Error_Provider.SetError(DtpFecha_Nac,"Ingrese Fecha de Nacimiento");
                band = false;
            }
            return band;
        }

        public Boolean validar_Cedula() //Metodo para validar si el campo de ceudla esta vacio o incompleto
        {
            Boolean band = true;
            if (txtCedula.Text.Length < 16)
            {
                band = false;
                Error_Provider.SetError(txtCedula, "Cedula Incompleta o Espacio vacio");
            }
            return band;
        }
        public void Borrar_ErrorProvider ()
        {
            Error_Provider.SetError(txtCedula,"");
            Error_Provider.SetError(txtPrimer_Nombre, "");
            Error_Provider.SetError(txtPrimerApellido, "");
            Error_Provider.SetError(cbSexo, "");
            Error_Provider.SetError(DtpFecha_Nac, "");
        }

        public void Cantidad_Cliente()
        {
            txtTotalClientes.Text = Convert.ToString(CCliente.Cantidad_Cliente().total);
            txtMembresiaActiva.Text = Convert.ToString(CCliente.Cantidad_Cliente().activo);
            txtMembresiaInactiva.Text = Convert.ToString(CCliente.Cantidad_Cliente().inactivo);
        }

        ///Metodos de eventos de Botones*************************************************************************************
        ///******************************************************************************************************************
        private void btnCerrar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("SE CERRARA LA VENTANA DE CLIENTES", "ATENCION", MessageBoxButtons.YesNo,MessageBoxIcon.Question) == (System.Windows.Forms.DialogResult.Yes))
            {
                this.Close();
            }
        }
        private void btnInsertar_Click(object sender, EventArgs e) //Evento de Boton Insertar
        {

           Borrar_ErrorProvider();
           if ((validar_Espacios_vacios() ==  true) )
            {
                Cedula = txtCedula.Text;
                PNombre = txtPrimer_Nombre.Text;
                SNombre = txtSegundo_Nombre.Text;
                PApellido = txtPrimerApellido.Text;
                SApellido = txtSegundoApellido.Text;
                if (cbSexo.SelectedIndex == 1)
                {
                    sexo_char = 'F';
                }
                else
                {
                    sexo_char = 'M';
                }
                Fecha_Nac = DtpFecha_Nac.Text;
                if (CCliente.Insertar_Cliente(Cedula, PNombre, SNombre, PApellido, SApellido, sexo_char, Fecha_Nac) == true)
                {
                    MessageBox.Show("CLIENTE INGRESADO", "ATENCION",MessageBoxButtons.OK,MessageBoxIcon.Information);

                    mostrar_clientes();
                    Cantidad_Cliente();
                }
                else
                {
                    MessageBox.Show("EL CLIENTE YA EXISTE EN LA BASE DE DATOS", "ATENCION",MessageBoxButtons.OK,MessageBoxIcon.Warning);
                    limpiar_texbox();
                }
            }
            else
            {
                MessageBox.Show("ERROR", "ADVERTENCIA",MessageBoxButtons.OK,MessageBoxIcon.Exclamation);
            }

            
            
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
           Borrar_ErrorProvider();
           
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            Borrar_ErrorProvider();
            if ((validar_Cedula() == true))
            {
                if (MessageBox.Show("¿ESTA SEGURO QUE DESEA ELIMINAR ESTE CLIENTE?", "ATENCION", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == (System.Windows.Forms.DialogResult.Yes))
                {
                    Cedula = txtCedula.Text;
                    if (CCliente.Eliminar_Cliente(Cedula) == true)
                    {
                        MessageBox.Show("CLIENTE ELIMINADO", "ATENCION", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        mostrar_clientes();
                        Cantidad_Cliente();
                    }
                    else
                    {
                        MessageBox.Show("EL CLIENTE NO EXISTE EN LA BASE DE DATOS", "ATENCION", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        limpiar_texbox();
                    }
                }
            }
            else
            {
                MessageBox.Show("ERROR", "ADVERTENCIA", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }


        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            limpiar_texbox();
        }
    }
}
