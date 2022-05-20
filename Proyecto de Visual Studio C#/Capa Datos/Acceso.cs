using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_Datos
{
     public class Acceso
    {
        private String Cadena = "Data Source=(Local); Initial Catalog=Gimnasio; Integrated Security= true";
        public SqlConnection conexion_datos; // se declara una objeto de tipo SqlConnection para establecer la conexion

        public Acceso() //dentro del constructo llamamos al metodo de conexion
         {
            conectar();
         }

    public void conectar()
        {
            conexion_datos = new SqlConnection(Cadena);// se instancia el objeto de tipo conexion agregando como parametro la cadena de conexion
        }
    }
}
