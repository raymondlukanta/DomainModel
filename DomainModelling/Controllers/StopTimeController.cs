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
    public class StopTimeController : Controller
    {
        private GtfsEntities db = new GtfsEntities();

        //
        // GET: /StopTime/

        public ActionResult Index()
        {
            return View(db.stop_times.Take(40).ToList());
        }

        //
        // GET: /StopTime/Details/5

        public ActionResult Details(int id1, string id2)
        {
            if (id2 != null)
            {
                StopTime stoptime = db.stop_times.Where(q => q.stop_sequence == id1 && q.trip_id == id2).FirstOrDefault();
                if (stoptime == null)
                {
                    return HttpNotFound();
                }
                return View(stoptime);
            }
            return HttpNotFound();
        }

        //
        // GET: /StopTime/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /StopTime/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(StopTime stoptime)
        {
            if (ModelState.IsValid)
            {
                db.stop_times.Add(stoptime);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(stoptime);
        }

        //
        // GET: /StopTime/Edit/5

        public ActionResult Edit(int id1, string id2)
        {
            if (id2 != null)
            {
                StopTime stoptime = db.stop_times.Where(q => q.stop_sequence == id1 && q.trip_id == id2).FirstOrDefault();
                if (stoptime == null)
                {
                    return HttpNotFound();
                }
                return View(stoptime);
            }
            return HttpNotFound();
        }

        //
        // POST: /StopTime/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(StopTime stoptime)
        {
            if (ModelState.IsValid)
            {
                db.Entry(stoptime).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(stoptime);
        }

        //
        // GET: /StopTime/Delete/5

        public ActionResult Delete(int id1, string id2)
        {
            if (id2 != null)
            {
                StopTime stoptime = db.stop_times.Where(q => q.stop_sequence == id1 && q.trip_id == id2).FirstOrDefault();
                if (stoptime == null)
                {
                    return HttpNotFound();
                }
                return View(stoptime);
            }
            return HttpNotFound();
        }

        //
        // POST: /StopTime/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            StopTime stoptime = db.stop_times.Find(id);
            db.stop_times.Remove(stoptime);
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