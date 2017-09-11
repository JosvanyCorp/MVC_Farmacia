using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Capa_Datos
{
    public class Conexion
    {
        public static GDatos GDatos;
        // mando a llamar abrir cesion
        public static bool IniciarSesion(string nombreServidor, string baseDatos, string usuario, string password)
        {
            GDatos = new SqlServer(nombreServidor, baseDatos, usuario, password);
            return GDatos.Autenticar(usuario, password);
        } //fin inicializa sesion

        public static bool IniciarSesion(string nombreServidor, string baseDatos)
        {
            GDatos = new SqlServer(nombreServidor, baseDatos);
            return GDatos.Autenticar(true);
        }
        public static bool IniciarSesion(string locationBD)
        {
            GDatos = new SqlServer(locationBD);
            return GDatos.Autenticar(true);
        }

        //mando a cerrar cesion
        public static void FinalizarSesion()
        {
            GDatos.CerrarConexion();
        } //fin FinalizaSesion


    }
}
