using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Entity
{
    public class Categorias_Entity
    {
        public Categorias_Entity()
        {
        }
        public Guid CatIntIdValue { get; set; }

        [Required(ErrorMessage = "Favor Ingresar Nombre")]
        public string CatNombreValue { get; set; }
        public string CatCodigoValue { get; set; }
        public bool CatStatusValue { get; set; }
    }
}
