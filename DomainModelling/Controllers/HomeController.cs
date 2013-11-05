using DomainModelling.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DomainModelling.Controllers
{
    public class HomeController : Controller
    {
        private GtfsEntities db = new GtfsEntities();
        public ActionResult Index()
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            return View();
        }

        public ActionResult About()
        {
            ListStops stop = new ListStops();
            stop.stopList = db.Stops.ToList();

            return View(stop);
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Map()
        {
            return View();
        }
    }
}
