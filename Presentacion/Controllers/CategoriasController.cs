using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Entity;

namespace Presentacion.Controllers
{
    public class CategoriasController : Controller
    {
        public ActionResult Index()
        {
            return View(CategoriasBLL.Listar());
        }

        public ActionResult Crud(Guid idCat)
        {
            return View(idCat == Guid.Empty ? new Categorias_Entity() : CategoriasBLL.Listar(idCat));
        }
    }
}