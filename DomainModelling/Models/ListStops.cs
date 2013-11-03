using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DomainModelling.Models
{
    public class ListStops
    {
        public ListStops()
        {
            this.stopList = new HashSet<stop>();
        }
        public virtual ICollection<stop> stopList { get; set; } 
    }
}