using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Capa_Datos;
using Entity;


namespace Capa_Datos.Orm
{
    public class Cls_Categorias
    {
        #region "Metodos"
        public bool Create(Categorias_Entity objCat)
        {
            bool flag = false;

            try
            {
                Conexion.GDatos.Ejecutar("SP_IM_Categoria", objCat.CatIntIdValue, objCat.CatNombreValue, objCat.CatCodigoValue, objCat.CatStatusValue);
            }
            catch (Exception)
            {

                throw;
            }

            return flag;
        }


        public static List<Categorias_Entity> Listar()
        {
            Conexion.IniciarSesion(".", "DB_Farmacia", "sa", "josvany");

            var objCat = new List<Categorias_Entity>();

            var dt = Conexion.GDatos.TraerDataTable("SP_Listar", "CAT_CATEGORIA");

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                objCat.Add(new Categorias_Entity
                {
                    CatIntIdValue = (Guid)dt.Rows[i][0],
                    CatNombreValue = dt.Rows[i][1].ToString()
                });
            }
            //if (dt.Rows.Count > 0)
            //{
            //    objCat.CatIntIdValue = (Guid)dt.Rows[0][0];
            //    objCat.CatNombreValue = dt.Rows[0][1].ToString();
            //}
            Conexion.FinalizarSesion();
            return objCat;
        }


        public static Categorias_Entity Listar(Guid idCat)
        {
            var objCat = new Categorias_Entity();

            Conexion.IniciarSesion(".", "DB_Farmacia", "sa", "josvany");
            try
            {
                //var dt = Conexion.GDatos.TraerDataTable("",idCat);
                DataTable dt = Conexion.GDatos.TraerDataTable("SP_Listar", "CAT_CATEGORIA");
                var row = (from Cat in dt.AsEnumerable()
                           where Cat.Field<Guid>("CAT_INT_ID") == idCat
                           select Cat).ToList();
                if (row.Count > 0)
                {

                    objCat.CatIntIdValue = (Guid)row[0].ItemArray[0];
                    objCat.CatNombreValue = row[0].ItemArray[1].ToString();
                    objCat.CatCodigoValue = row[0].ItemArray[2].ToString();
                    objCat.CatStatusValue = (bool)row[0].ItemArray[3];

                }
            }
            catch (Exception)
            {

                throw;
            }
            Conexion.FinalizarSesion();
            return objCat;
        }

        #endregion
    }
}
