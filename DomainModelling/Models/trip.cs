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
    
    public partial class Trip
    {
        public Trip()
        {
            this.stop_times = new HashSet<StopTime>();
        }
    
        public string route_id { get; set; }
        public string service_id { get; set; }
        public string trip_id { get; set; }
        public string trip_headsign { get; set; }
        public string trip_short_name { get; set; }
        public string direction_id { get; set; }
        public string block_id { get; set; }
        public string shape_id { get; set; }
        public string wheelchair_boarding { get; set; }
    
        internal virtual Frequency frequency { get; set; }
        internal virtual Route route { get; set; }
        internal virtual ICollection<StopTime> stop_times { get; set; }
    }
}
