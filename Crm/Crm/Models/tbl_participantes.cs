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
    
    public partial class tbl_participantes
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_participantes()
        {
            this.tbl_puntos = new HashSet<tbl_puntos>();
        }
    
        public int id { get; set; }
        public string nombre { get; set; }
        public string apellidos { get; set; }
        public string dni { get; set; }
        public string email { get; set; }
        public string clave { get; set; }
        public string imagen { get; set; }
        public string pais { get; set; }
        public string localidad { get; set; }
        public string puntos { get; set; }
        public System.DateTime registro { get; set; }
        public string estatus { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_puntos> tbl_puntos { get; set; }
    }
}
