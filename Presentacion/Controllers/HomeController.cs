using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Entity;

namespace Presentacion.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View(CategoriasBLL.Listar());
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View(CategoriasBLL.Listar());
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View(CategoriasBLL.Listar());
        }
    }
}