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
    
    public partial class Agency
    {
        public Agency()
        {
            this.route = new HashSet<Route>();
        }
    
        public string agency_id { get; set; }
        public string agency_name { get; set; }
        public string agency_url { get; set; }
        public string agency_time_zone { get; set; }
        public string agency_lang { get; set; }
        public string agency_phone { get; set; }
    
        public virtual ICollection<Route> route { get; set; }
    }
}
