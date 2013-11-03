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
    
    public partial class stop_times
    {
        public string trip_id { get; set; }
        public System.TimeSpan arrival_time { get; set; }
        public System.TimeSpan departure_time { get; set; }
        public string stop_id { get; set; }
        public string stop_headsign { get; set; }
        public Nullable<int> pickup_type { get; set; }
        public Nullable<int> dropoff_type { get; set; }
        public Nullable<double> shape_distance_travelled { get; set; }
        public int stop_sequence { get; set; }
    
        public virtual trip trip { get; set; }
        public virtual stop stop { get; set; }
    }
}
