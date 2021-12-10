using QuanLyTinTuc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyTinTuc.Controllers
{
    public class HomeController : Controller
    {
        private QLTinTucEntities1 db = new QLTinTucEntities1();
        public ActionResult Index()
        {
            return View();
        }
        
        public ActionResult About()
        {
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult PopularPost()
        {
            return PartialView(db.TinTucs.Take(8).Where(m => m.TrangThai == true).OrderByDescending(m => m.SoLanXem).ToList());
        }
        public ActionResult NewPost()
        {
            return PartialView(db.TinTucs.Take(8).Where(m => m.TrangThai == true).OrderByDescending(m => m.Ngay).ToList());
        }


    }
}