using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QuanLyTinTuc.Models;

namespace QuanLyTinTuc.Controllers
{
    public class BinhLuansController : Controller
    {
        private QLTinTucEntities1 db = new QLTinTucEntities1();

        // GET: BinhLuans
        public ActionResult Index()
        {
            var binhLuans = db.BinhLuans.Include(b => b.TinTuc);
            return View(binhLuans.ToList());
        }

        // GET: BinhLuans/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BinhLuan binhLuan = db.BinhLuans.Find(id);
            if (binhLuan == null)
            {
                return HttpNotFound();
            }
            return View(binhLuan);
        }

        // GET: BinhLuans/Create
        public ActionResult Create()
        {
            ViewBag.MaTinTuc = new SelectList(db.TinTucs, "MaTinTuc", "TieuDe");
            return View();
        }

        // POST: BinhLuans/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Noidung,HoTen,Email,MaTinTuc")] BinhLuan binhLuan)
        {
            if (ModelState.IsValid)
            {
                binhLuan.ThoiGian = DateTime.Now;
                binhLuan.TrangThai = 1;
                db.BinhLuans.Add(binhLuan);
                db.SaveChanges();
                return RedirectToAction("Index","Home");
            }

            ViewBag.MaTinTuc = new SelectList(db.TinTucs, "MaTinTuc", "TieuDe", binhLuan.MaTinTuc);
            return RedirectToAction("Index", "Home");
        }

        // GET: BinhLuans/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BinhLuan binhLuan = db.BinhLuans.Find(id);
            if (binhLuan == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaTinTuc = new SelectList(db.TinTucs, "MaTinTuc", "TieuDe", binhLuan.MaTinTuc);
            return View(binhLuan);
        }

        // POST: BinhLuans/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaBinhLuan,ThoiGian,Noidung,HoTen,Email,TrangThai,MaTinTuc")] BinhLuan binhLuan)
        {
            if (ModelState.IsValid)
            {
                db.Entry(binhLuan).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaTinTuc = new SelectList(db.TinTucs, "MaTinTuc", "TieuDe", binhLuan.MaTinTuc);
            return View(binhLuan);
        }

        // GET: BinhLuans/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BinhLuan binhLuan = db.BinhLuans.Find(id);
            if (binhLuan == null)
            {
                return HttpNotFound();
            }
            return View(binhLuan);
        }

        // POST: BinhLuans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BinhLuan binhLuan = db.BinhLuans.Find(id);
            db.BinhLuans.Remove(binhLuan);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
