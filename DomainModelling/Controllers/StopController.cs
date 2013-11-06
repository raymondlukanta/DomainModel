using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DomainModelling.Models;

namespace DomainModelling.Controllers
{
    public class StopController : Controller
    {
        private GtfsEntities db = new GtfsEntities();

        //
        // GET: /Stop/

        public ActionResult Index()
        {
            return View(db.stops.ToList());
        }

        //
        // GET: /Stop/Details/5

        public ActionResult Details(string id = null)
        {
            Stop stop = db.stops.Find(id);
            if (stop == null)
            {
                return HttpNotFound();
            }
            return View(stop);
        }

        //
        // GET: /Stop/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Stop/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Stop stop)
        {
            if (ModelState.IsValid)
            {
                db.stops.Add(stop);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(stop);
        }

        //
        // GET: /Stop/Edit/5

        public ActionResult Edit(string id = null)
        {
            Stop stop = db.stops.Find(id);
            if (stop == null)
            {
                return HttpNotFound();
            }
            return View(stop);
        }

        //
        // POST: /Stop/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Stop stop)
        {
            if (ModelState.IsValid)
            {
                db.Entry(stop).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(stop);
        }

        //
        // GET: /Stop/Delete/5

        public ActionResult Delete(string id = null)
        {
            Stop stop = db.stops.Find(id);
            if (stop == null)
            {
                return HttpNotFound();
            }
            return View(stop);
        }

        //
        // POST: /Stop/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Stop stop = db.stops.Find(id);
            db.stops.Remove(stop);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}