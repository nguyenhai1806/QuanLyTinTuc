using QuanLyTinTuc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyTinTuc.Controllers
{
    public class TinTucController : Controller
    {
        private QLTinTucEntities1 db = new QLTinTucEntities1();
        // GET: TinTuc
        public ActionResult Xemchitiet(int Matt = 0)
        {
            var chitiet = db.TinTucs.SingleOrDefault(n => n.MaTinTuc == Matt);
            if (chitiet == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(chitiet);
        }
        public ActionResult ThoiSu()
        {
            return View(db.TinTucs.Where(n=>n.MaChuDe==1).ToList());
        }
        public ActionResult TheGioi()
        {
            return View(db.TinTucs.Where(n => n.MaChuDe == 2).ToList());
        }
        public ActionResult KinhDoanh()
        {
            return View(db.TinTucs.Where(n => n.MaChuDe == 3).ToList());
        }
        public ActionResult GiaiTri()
        {
            return View(db.TinTucs.Where(n => n.MaChuDe == 4).ToList());
        }
        public ActionResult TheThao()
        {
            return View(db.TinTucs.Where(n => n.MaChuDe == 5).ToList());
        }
        public ActionResult PhapLuat()
        {
            return View(db.TinTucs.Where(n => n.MaChuDe == 6).ToList());
        }
        public ActionResult GiaoDuc()
        {
            return View(db.TinTucs.Where(n => n.MaChuDe == 7).ToList());
        }
        public ActionResult SucKhoe()
        {
            return View(db.TinTucs.Where(n => n.MaChuDe == 8).ToList());
        }
        public ActionResult DoiSong()
        {
            return View(db.TinTucs.Where(n => n.MaChuDe == 9).ToList());
        }
    }
}