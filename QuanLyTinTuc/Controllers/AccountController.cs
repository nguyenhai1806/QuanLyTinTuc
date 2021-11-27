using QuanLyTinTuc.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace QuanLyTinTuc.Controllers
{
    public class AccountController : Controller
    {
        private QLTinTucEntities1 db = new QLTinTucEntities1();
        public ActionResult EditAccount(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Account account = db.Accounts.Find(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            return View(account);
        }

        // POST: User/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditAccount([Bind(Include = "MaAccount,Email,TenHienThi,MatKhau,TrangThai,Admin")] Account account)
        {
            if (ModelState.IsValid)
            {
                db.Entry(account).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Login");
            }
            return View(account);
        }
        // GET: Account
        // GET: User/Create
        public ActionResult Register()
        {
            return View();
        }

        // POST: User/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register([Bind(Include = "MaAccount,Email,TenHienThi,MatKhau,TrangThai,Admin")] Account account)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Accounts.Add(account);
                    db.SaveChanges();
                    return RedirectToAction("RegisterSuccess");
                }
            }
            catch
            {
                account.LoginErrorMessage = "Vui lòng kiểm tra xem bạn đã nhập đúng chưa";
            }


            return View(account);
        }
        public ActionResult RegisterSuccess()
        {

            return View();


        }
        public ActionResult Login()
        {
            return View();

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Account userModel)
        {
            using (QLTinTucEntities1 db = new QLTinTucEntities1())
            {
                //userModel.Password = BaiKTNho.Models.User.GetMD5(userModel.Password);
                var userDetails = db.Accounts.Where(x => x.TenHienThi == userModel.TenHienThi && x.MatKhau == userModel.MatKhau).FirstOrDefault();

                if (userDetails == null)
                {
                    userModel.LoginErrorMessage = "Sai tên đăng nhập hoặc mật khẩu!";
                    return View("Login", userModel);
                }
                else
                {
                    Session["Id"] = userDetails.MaAccount;
                    Session["UserEmail"] = userDetails.Email;
                    Session["Username"] = userDetails.TenHienThi;
                    
                    return RedirectToAction("LoginSuccess", "Account");
                }
            }
        }
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
        }

        public ActionResult LoginSuccess()
        {
            if (Session["Username"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }

        }
        public ActionResult ForgotPassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ForgotPassword(Account userModel)
        {
            
            //userModel.Password = BaiKTNho.Models.User.GetMD5(userModel.Password);
            var userDetails = db.Accounts.Where(x => x.TenHienThi == userModel.TenHienThi).FirstOrDefault();

            if (userDetails == null)
            {
                userModel.LoginErrorMessage = "Không tồn tại tên đăng nhập";
                return View("ForgotPassword", userModel);
            }
            else
            {
                
                var Receiver = Request.Form["Receiver"];
                
                var Subject = Request.Form["Subject"];
                Subject = "bennumber186@gmail.com";
                string Body = Request.Form["Body"];
                Body = "Mật khẩu của bạn là"+userDetails.MatKhau;
                var Email = System.Configuration.ConfigurationManager.AppSettings["Email"].ToString();
                MailMessage obj = new MailMessage(Email, Receiver);
                obj.Subject = Subject;
                obj.Body = Body;
                obj.IsBodyHtml = true;

                MailAddress bcc = new MailAddress("bennumber186@gmail.com");
                obj.Bcc.Add(bcc);            //attach file
                                             //HttpPostedFileBase file = Request.Files[0];
                                             //if (file.ContentLength > 0)
                                             //{
                                             //    string fileName = System.IO.Path.GetFileName(file.FileName);
                                             //    obj.Attachments.Add(new System.Net.Mail.Attachment(file.InputStream, fileName));
                                             //}
                using (SmtpClient smtp = new SmtpClient())
                {
                    var Password = System.Configuration.ConfigurationManager.AppSettings["PasswordEmail"].ToString();

                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential(Email, Password);
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;//465

                    smtp.Send(obj);
                    ViewBag.Message = "Email sent.";

                    try
                    {
                        smtp.Send(obj);
                        ViewBag.Message = "Sent Email";
                    }
                    catch (Exception ex)
                    {
                        ViewBag.Message = "Err:" + ex.ToString();

                    }
                }
                return RedirectToAction("SentMail","Account");
            }
        }
        public ActionResult SentMail()
        {
            return View();
        }
    }
}