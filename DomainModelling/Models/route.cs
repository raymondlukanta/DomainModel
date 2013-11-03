//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DomainModelling.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class route
    {
        public route()
        {
            this.trips = new HashSet<trip>();
        }
    
        public string route_id { get; set; }
        public string agency_id { get; set; }
        public string route_short_name { get; set; }
        public string route_long_name { get; set; }
        public string route_desc { get; set; }
        public int route_type { get; set; }
        public string route_colour { get; set; }
        public string route_url { get; set; }
        public string route_text_colour { get; set; }
    
        public virtual agency agency { get; set; }
        public virtual ICollection<trip> trips { get; set; }
    }
}
