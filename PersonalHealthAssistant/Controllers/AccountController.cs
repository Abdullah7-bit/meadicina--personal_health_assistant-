using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using PersonalHealthAssistant.Models;

namespace PersonalHealthAssistant.Controllers
{
    public class AccountController : Controller
    {
        PersonalHealthAssistantEntities db = new PersonalHealthAssistantEntities();

        public ActionResult Dashboard()
        {
            return View();

        }

        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(User t)
        {
            var query = db.Users.SingleOrDefault(m => m.Email == t.Email && m.Password == t.Password);

            if (query.Role_Id == 1)
            {
                Session["Name"] = query.Email;
                FormsAuthentication.SetAuthCookie(query.Email, false);
                return RedirectToAction("Index", "Home");
            }

            else if (query.Role_Id == 2)
            {
                Session["Name"] = query.Email;
                FormsAuthentication.SetAuthCookie(query.Email, false);
                return RedirectToAction("Index", "Home");
            }

            else if (query.Role_Id == 3)
            {
                Session["Name"] = query.Email;
                FormsAuthentication.SetAuthCookie(query.Email, false);
                return RedirectToAction("Dashboard", "Account");
            }
            return View();
        }

        public ActionResult Signout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("login", "Account");
        }
    }
}