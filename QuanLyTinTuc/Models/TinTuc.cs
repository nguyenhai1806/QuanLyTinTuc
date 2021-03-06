//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyTinTuc.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TinTuc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TinTuc()
        {
            this.BinhLuans = new HashSet<BinhLuan>();
        }
    
        public int MaTinTuc { get; set; }
        public string TieuDe { get; set; }
        public string HinhDaiDien { get; set; }
        public string NoiDung { get; set; }
        public Nullable<System.DateTime> Ngay { get; set; }
        public Nullable<int> SoLanXem { get; set; }
        public Nullable<bool> TrangThai { get; set; }
        public Nullable<int> MaChuDe { get; set; }
        public int MaAccount { get; set; }
    
        public virtual Account Account { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BinhLuan> BinhLuans { get; set; }
        public virtual ChuDe ChuDe { get; set; }
    }
}
