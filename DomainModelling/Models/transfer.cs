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
    
    public partial class Transfer
    {
        public string from_stop_id { get; set; }
        public string to_stop_id { get; set; }
        public int transfer_type { get; set; }
        public int min_transfer_time { get; set; }
    
        public virtual Stop stops { get; set; }
        public virtual Stop stops1 { get; set; }
    }
}
