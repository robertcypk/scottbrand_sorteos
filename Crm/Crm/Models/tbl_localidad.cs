//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Crm.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_localidad
    {
        public int id { get; set; }
        public int idpais { get; set; }
        public string localidad { get; set; }
    
        public virtual tbl_paises tbl_paises { get; set; }
    }
}