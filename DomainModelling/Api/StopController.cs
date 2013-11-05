using DomainModelling.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace DomainModelling.Api
{
    public class StopController : ApiController
    {
        private GtfsEntities db = new GtfsEntities();

        // GET api/<controller>
        public IEnumerable<Stop> Get()
        {
            return db.stops.ToList();
        }

        // GET api/<controller>/5
        public Stop Get(string id)
        {
            return db.stops.Find(id);
        }
    }
}