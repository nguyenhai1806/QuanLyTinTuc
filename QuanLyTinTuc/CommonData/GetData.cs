using QuanLyTinTuc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyTinTuc
{
    public class GetData
    {
        private QLTinTucEntities1 db = new QLTinTucEntities1();
        public List<Models.TinTuc> GetPopularPost()
        {
            return db.TinTucs.Take(2)
                .Where(m => m.TrangThai == true).OrderByDescending(m => m.SoLanXem).ToList();
        }
        public List<Models.TinTuc> GetNewPost()
        {
            DateTime now = DateTime.Now;
            return db.TinTucs.Take(2)
                .Where(m => m.TrangThai == true).OrderByDescending(m => m.Ngay).ToList();
        }
    }
}