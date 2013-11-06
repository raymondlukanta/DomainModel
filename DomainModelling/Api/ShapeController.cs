using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using DomainModelling.Models;

namespace DomainModelling.Api
{
    public class ShapeController : ApiController
    {
        private GtfsEntities db = new GtfsEntities();

        // GET api/Shape
        public IEnumerable<Shape> GetShapes()
        {
            return db.shapes.OrderBy(s => s.shape_id).ThenBy(s => s.shape_pt_sequence).AsEnumerable();
        }

        // GET api/Shape/5
        public Shape GetShape(string id)
        {
            Shape shape = db.shapes.Find(id);
            if (shape == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return shape;
        }

        // PUT api/Shape/5
        public HttpResponseMessage PutShape(string id, Shape shape)
        {
            if (ModelState.IsValid && id == shape.shape_id)
            {
                db.Entry(shape).State = EntityState.Modified;

                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound);
                }

                return Request.CreateResponse(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // POST api/Shape
        public HttpResponseMessage PostShape(Shape shape)
        {
            if (ModelState.IsValid)
            {
                db.shapes.Add(shape);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, shape);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = shape.shape_id }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // DELETE api/Shape/5
        public HttpResponseMessage DeleteShape(string id)
        {
            Shape shape = db.shapes.Find(id);
            if (shape == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.shapes.Remove(shape);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return Request.CreateResponse(HttpStatusCode.OK, shape);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}