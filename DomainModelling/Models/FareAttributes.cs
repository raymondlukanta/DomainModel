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
    
    public partial class FareAttributes
    {
        public string fare_id { get; set; }
        public string price { get; set; }
        public string currency_type { get; set; }
        public string payment_method { get; set; }
        public string transfers { get; set; }
        public string transfer_duration { get; set; }
    
        internal virtual FareRules fare_rules { get; set; }
    }
}
