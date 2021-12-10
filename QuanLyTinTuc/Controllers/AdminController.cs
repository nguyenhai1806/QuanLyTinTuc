using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyTinTuc.Models;
using PagedList;
using System.IO;
using System.Net;
using System.Data.Entity;

namespace QuanLyTinTuc.Controllers
{

    public class AdminController : Controller
    {
        private QLTinTucEntities1 db = new QLTinTucEntities1();
        // GET: Admin
        public ActionResult Index()
        {
            if (Session["Id"] == null)
                return RedirectToAction("Login", "Account");
            else
                return View();
        }
        //List post của admin
        public ActionResult ListPost(string sortOrder, string CurrentSort, int? page, string titleStr)
        {
            if (Session["Id"] == null)
                return RedirectToAction("Login", "Account");
            //DVCPContext db = new DVCPContext();
            int pageSize = 100;
            int pageIndex = 1;
            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            ViewBag.CurrentSort = sortOrder;
            sortOrder = String.IsNullOrEmpty(sortOrder) ? "Title" : sortOrder;
            IPagedList<QuanLyTinTuc.Models.TinTuc> post = null;
            ViewBag.Sort = "tăng dần";
            if (String.IsNullOrWhiteSpace(titleStr))
            {
                switch (sortOrder)
                {
                    case "Title":
                        ViewBag.sortname = "tiêu đề";
                        if (sortOrder.Equals(CurrentSort))
                        {
                            ViewBag.Sort = "giảm dần";
                            //post = db.postRepository.AllPosts().OrderByDescending
                            //        (m => m.post_title).ToPagedList(pageIndex, pageSize);
                            post = db.TinTucs.OrderByDescending
                                (m => m.TieuDe).ToPagedList(pageIndex, pageSize);
                        }

                        else
                        {
                            //post = db.postRepository.AllPosts().OrderBy
                            //        (m => m.post_title).ToPagedList(pageIndex, pageSize);
                            post = db.TinTucs.OrderBy
                                (m => m.TieuDe).ToPagedList(pageIndex, pageSize);
                        }
                        break;
                    case "CreateDate":
                        ViewBag.sortname = "ngày tạo";
                        if (sortOrder.Equals(CurrentSort))
                        {
                            ViewBag.Sort = "giảm dần";
                            //post = db.postRepository.AllPosts().OrderByDescending
                            //        (m => m.create_date).ToPagedList(pageIndex, pageSize);
                            post = db.TinTucs.OrderByDescending
                                (m => m.Ngay).ToPagedList(pageIndex, pageSize);
                        }

                        else
                        {
                            //post = db.postRepository.AllPosts().OrderBy
                            //        (m => m.create_date).ToPagedList(pageIndex, pageSize);
                            post = db.TinTucs.OrderBy
                                (m => m.Ngay).ToPagedList(pageIndex, pageSize);
                        }

                        break;
                    case "View":
                        ViewBag.sortname = "lượt xem";
                        if (sortOrder.Equals(CurrentSort))
                        {
                            ViewBag.Sort = "giảm dần";
                            //post = db.postRepository.AllPosts().OrderByDescending
                            //        (m => m.ViewCount).ToPagedList(pageIndex, pageSize);
                            post = db.TinTucs.OrderByDescending
                                (m => m.SoLanXem).ToPagedList(pageIndex, pageSize);
                        }

                        else
                        {
                            //post = db.postRepository.AllPosts().OrderBy
                            //        (m => m.ViewCount).ToPagedList(pageIndex, pageSize);
                            post = db.TinTucs.OrderBy
                                (m => m.SoLanXem).ToPagedList(pageIndex, pageSize);
                        }

                        break;
                        //default:
                        //    post = UnitOfWork.postRepository.AllPosts().ToPagedList(pageIndex, pageSize);
                        //    break;
                }
            }
            else
            {
                ViewBag.titleStr = titleStr;
                switch (sortOrder)
                {
                    case "Title":
                        ViewBag.sortname = "tiêu đề";
                        if (sortOrder.Equals(CurrentSort))
                        {
                            ViewBag.Sort = "giảm dần";
                            post = db.TinTucs.Where(m => m.TieuDe.ToLower().Contains(titleStr.ToLower())).OrderByDescending
                                    (m => m.TieuDe).ToPagedList(pageIndex, pageSize);
                        }
                        else
                        {
                            //post = db.postRepository.AllPosts().Where(m => m.post_title.ToLower().Contains(titleStr.ToLower())).OrderBy
                            //          (m => m.post_title).ToPagedList(pageIndex, pageSize);
                            post = db.TinTucs.Where(m => m.TieuDe.ToLower().Contains(titleStr.ToLower())).OrderBy
                                    (m => m.TieuDe).ToPagedList(pageIndex, pageSize);
                        }
                        break;
                    case "CreateDate":
                        ViewBag.sortname = "ngày tạo";
                        if (sortOrder.Equals(CurrentSort))
                        {
                            ViewBag.Sort = "giảm dần";
                            post = db.TinTucs.Where(m => m.TieuDe.ToLower().Contains(titleStr.ToLower())).OrderByDescending
                                    (m => m.Ngay).ToPagedList(pageIndex, pageSize);
                        }

                        else
                        {
                            post = db.TinTucs.Where(m => m.TieuDe.ToLower().Contains(titleStr.ToLower())).OrderBy
                                   (m => m.Ngay).ToPagedList(pageIndex, pageSize);
                        }
                        break;
                    case "View":
                        ViewBag.sortname = "lượt xem";
                        if (sortOrder.Equals(CurrentSort))
                        {
                            ViewBag.Sort = "giảm dần";
                            //post = db.postRepository.AllPosts().Where(m => m.post_title.ToLower().Contains(titleStr.ToLower())).OrderByDescending
                            //        (m => m.ViewCount).ToPagedList(pageIndex, pageSize);
                            post = db.TinTucs.Where(m => m.TieuDe.ToLower().Contains(titleStr.ToLower())).OrderByDescending
                                   (m => m.SoLanXem).ToPagedList(pageIndex, pageSize);
                        }

                        else
                        {
                            //post = db.postRepository.AllPosts().Where(m => m.post_title.ToLower().Contains(titleStr.ToLower())).OrderBy
                            //         (m => m.ViewCount).ToPagedList(pageIndex, pageSize);
                            post = db.TinTucs.Where(m => m.TieuDe.ToLower().Contains(titleStr.ToLower())).OrderBy
                                   (m => m.SoLanXem).ToPagedList(pageIndex, pageSize);
                        }
                        break;
                        //default:
                        //    post = UnitOfWork.postRepository.AllPosts().Where(m => m.post_title.ToLower().Contains(titleStr.ToLower())).ToPagedList(pageIndex, pageSize);
                        //    break;
                }
            }
            return View(post);
        }
        public ActionResult newPost()
        {
            if (Session["Id"] == null)
                return RedirectToAction("Index", "Home");
            ViewBag.MaChuDe = new SelectList(db.ChuDes, "MaChuDe", "TenChuDe");
            return View();
        }

        // POST: TinTucs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        //[ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult newPost([Bind(Include = "MaTinTuc,TieuDe,HinhDaiDien,NoiDung,Ngay,SoLanXem,TrangThai,MaChuDe,MaAccount")] TinTuc tinTuc, HttpPostedFileBase avatarFile)
        {
            if (ModelState.IsValid)
            {
                if (avatarFile.FileName != "")
                {
                    string tenHinh = Path.GetFileName(avatarFile.FileName);
                    avatarFile.SaveAs(Path.Combine(Server.MapPath("~/Upload/images/"), tenHinh));
                    tinTuc.HinhDaiDien = avatarFile.FileName;
                }
                if (tinTuc.Ngay == null)
                    tinTuc.Ngay = DateTime.Now;
                tinTuc.SoLanXem = 0;
                tinTuc.MaAccount = int.Parse(Session["Id"].ToString());
                db.TinTucs.Add(tinTuc);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaChuDe = new SelectList(db.ChuDes, "MaChuDe", "TenChuDe", tinTuc.MaChuDe);
            return View(tinTuc);
        }
        // GET: TinTucs/Edit/5
        public ActionResult editPost(int? id)
        {
            if (Session["Id"] == null)
                return RedirectToAction("Login", "Account");

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc tinTuc = db.TinTucs.Find(id);
            if (tinTuc == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaChuDe = new SelectList(db.ChuDes, "MaChuDe", "TenChuDe", tinTuc.MaChuDe);
            return View(tinTuc);
        }

        // POST: TinTucs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        //[ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult editPost([Bind(Include = "MaTinTuc, TieuDe,HinhDaiDien,NoiDung,Ngay,SoLanXem,TrangThai,MaChuDe,MaAccount")] TinTuc tinTuc, HttpPostedFileBase avatarFile)
        {
            if (Session["Id"] == null)
                return RedirectToAction("Login", "Account");

            if (ModelState.IsValid)
            {
                if (avatarFile.FileName != "")
                {
                    string tenHinh = Path.GetFileName(avatarFile.FileName);
                    avatarFile.SaveAs(Path.Combine(Server.MapPath("~/Upload/images/"), tenHinh));
                    tinTuc.HinhDaiDien = avatarFile.FileName;
                }
                tinTuc.MaAccount = int.Parse(Session["Id"].ToString());
                db.Entry(tinTuc).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaChuDe = new SelectList(db.ChuDes, "MaChuDe", "TenChuDe", tinTuc.MaChuDe);
            return View(tinTuc);
        }

        // GET: TinTucs/Delete/5
        public ActionResult DeletePost(int? id)
        {
            if (Session["Id"] == null)
                return RedirectToAction("Index", "Home");

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc tinTuc = db.TinTucs.Find(id);
            if (tinTuc == null)
            {
                return HttpNotFound();
            }
            return View(tinTuc);
        }

        // POST: TinTucs/Delete/5
        [HttpPost, ActionName("DeletePost")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TinTuc tinTuc = db.TinTucs.Find(id);
            db.TinTucs.Remove(tinTuc);
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

        public ActionResult Details(int? id)
        {
            if (Session["Id"] == null)
                return RedirectToAction("Login", "Account");

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc tinTuc = db.TinTucs.Find(id);
            if (tinTuc == null)
            {
                return HttpNotFound();
            }
            return View(tinTuc);
        }

        //
        // GET: /Account/Login
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        //
        // POST: /Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Account objUser)
        {
            if (ModelState.IsValid)
            {
                using (QLTinTucEntities1 db = new QLTinTucEntities1())
                {               
                    var obj = db.Accounts.Where(a => a.Email.Equals(objUser.Email) && a.MatKhau.Equals(objUser.MatKhau)).FirstOrDefault();
                    if (obj != null)
                    {
                        Session["UserEmail"] = obj.Email.ToString();
                        Session["UserName"] = obj.TenHienThi.ToString();
                        Session["IsAdmin"] = obj.Admin;
                        Session["Id"] = obj.MaAccount;
                        ViewBag.ID = obj.MaAccount;
                        ViewBag.UserName = obj.TenHienThi;
                        if (obj.Admin == true)
                            return View("Index");
                        else return RedirectToAction("Index", "User");
                    }
                    ViewBag.Error = "Login Fail";
                    //return RedirectToAction("SaiMk");
                    return View();
                }
            }
            ViewBag.Error = "Wrong username or password!";
            // return RedirectToAction("Index", "Home");
            return RedirectToAction("Index", "Admin");

            // If we got this far, something failed, redisplay form
            //return View();
        }

        public ActionResult SaiMk()
        {
            return View();
        }
        public ActionResult IndexUser()
        {
            return View();
        }
    }
}