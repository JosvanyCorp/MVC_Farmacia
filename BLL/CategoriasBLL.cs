using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Capa_Datos.Orm;

namespace BLL
{
    public class CategoriasBLL
    {
        public static List<Categorias_Entity> Listar()
        {
            return Cls_Categorias.Listar();
        }
    }
}
