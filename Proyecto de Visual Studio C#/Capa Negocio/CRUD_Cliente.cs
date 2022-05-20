using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Datos; // se agrega la refetencia de la capa datos

namespace Capa_Negocio
{
    public class CRUD_Cliente
    {
        Capa_Datos.Acceso conexion = new Capa_Datos.Acceso(); //se instancia un objeto de tipo acceso
        private SqlCommand Comando; //objeto de tipo SqlCommand para los comandos de sql
        SqlDataAdapter Adaptador; //objeto de tipo sqlAdapter para convertir las tablas de sql y guardarlas en una tabla

        public DataTable Mostrar_Cliente()
        {
            DataTable Tabla_Cliente = new DataTable(); //Instancia de un ojeto de tipo DataTable para recibir la tabla que devuelde el objeto SqlDataAdapter
            conexion.conexion_datos.Open(); //se abre la conexion para el comando
            Comando = new SqlCommand(); //instancia del objeto de tipo sqlcommando
            Comando.CommandText = "SP_Mostrar_Clientes"; //se pasa el procedimiento almancenado
            Comando.Connection = conexion.conexion_datos; // se abre la conexion para el comando
            Adaptador = new SqlDataAdapter(Comando); //se reciebe la tabla producto de la ejecucion del procedimiento
            Adaptador.Fill(Tabla_Cliente); // con el SqlDataAdapter se llena la tabla
            conexion.conexion_datos.Close(); // se cierra la conexion
            return Tabla_Cliente; // retorno de la tabla 
        }
        public bool Insertar_Cliente(String Cedula, String PNombre, String SNombre, String PApellido, String SApellido, Char Sexo, String Fecha)
        {
            int salida;
            conexion.conexion_datos.Open();
            Comando = new SqlCommand();
            Comando.CommandText = "SP_Insertar_Cliente";
            Comando.CommandType = System.Data.CommandType.StoredProcedure;
            Comando.Parameters.Add(new SqlParameter("@Cedula_Cliente", System.Data.SqlDbType.VarChar)).Value = Cedula;
            Comando.Parameters.Add(new SqlParameter("@Primer_Nombre", System.Data.SqlDbType.VarChar)).Value = PNombre;
            Comando.Parameters.Add(new SqlParameter("@Segundo_Nombre", System.Data.SqlDbType.VarChar)).Value = SNombre;
            Comando.Parameters.Add(new SqlParameter("@Primer_Apellido", System.Data.SqlDbType.VarChar)).Value = PApellido;
            Comando.Parameters.Add(new SqlParameter("@Segundo_Apellido", System.Data.SqlDbType.VarChar)).Value = SApellido;
            Comando.Parameters.Add(new SqlParameter("@Sexo", System.Data.SqlDbType.Char)).Value = Sexo;
            Comando.Parameters.Add(new SqlParameter("@Fecha_Nac", System.Data.SqlDbType.Date)).Value = Fecha;
            Comando.Parameters.Add("@salida", SqlDbType.Int).Direction = ParameterDirection.Output;
            Comando.Connection = conexion.conexion_datos; //Establece la conexio al objeto comando
            Comando.ExecuteNonQuery();
            salida = Convert.ToInt32(Comando.Parameters["@salida"].Value);
            conexion.conexion_datos.Close();
            if (salida == 0)
            {
                return true;
            }
            else return false;
        }
        public bool Eliminar_Cliente(String Cedula)
        {
            int salida;
            conexion.conexion_datos.Open();
            Comando = new SqlCommand();
            Comando.CommandText = "SP_Eliminar_Cliente";
            Comando.CommandType = System.Data.CommandType.StoredProcedure;
            Comando.Parameters.Add(new SqlParameter("@Cedula", System.Data.SqlDbType.VarChar)).Value = Cedula;
            Comando.Parameters.Add("@salida", SqlDbType.Int).Direction = ParameterDirection.Output;
            Comando.Connection = conexion.conexion_datos;
            Comando.ExecuteNonQuery();
            salida = Convert.ToInt32(Comando.Parameters["@salida"].Value);
            conexion.conexion_datos.Close();
            if (salida == 1)
            {
                return true;
            }
            else return false;
        }

        public struct Cantidad
        {
            public int activo;
            public int inactivo;
            public int total;
        }
        public Cantidad Cantidad_Cliente()
        {
            Cantidad c = new Cantidad();
            conexion.conexion_datos.Open();
            Comando = new SqlCommand();
            Comando.CommandText = "SP_Cantidad_Cliente";
            Comando.CommandType= System.Data.CommandType.StoredProcedure;
            Comando.Parameters.Add("@inactivo",SqlDbType.Int).Direction=ParameterDirection.Output;
            Comando.Parameters.Add("@activo",SqlDbType.Int).Direction=ParameterDirection.Output;
            Comando.Parameters.Add("@total",SqlDbType.Int).Direction=ParameterDirection.Output;
            Comando.Connection = conexion.conexion_datos;
            Comando.ExecuteNonQuery();
            c.activo = Convert.ToInt32(Comando.Parameters["@activo"].Value);
            c.inactivo = Convert.ToInt32(Comando.Parameters["@inactivo"].Value);
            c.total = Convert.ToInt32(Comando.Parameters["@total"].Value);
            conexion.conexion_datos.Close();
            return c;

        }
    }
}
