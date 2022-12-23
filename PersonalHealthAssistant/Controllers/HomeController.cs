using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PersonalHealthAssistant.Models;

namespace PersonalHealthAssistant.Controllers
{
    public class HomeController : Controller
    {
        PersonalHealthAssistantEntities db = new PersonalHealthAssistantEntities();

        public ActionResult Index()
        {
            var query = db.Doctors.ToList();

            return View(query);
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Contact(string email, string message)
        {
            Contact c = new Contact();
           
            c.Email = email;
            c.Message = message;
            db.Contacts.Add(c);
            db.SaveChanges();
            TempData["msg"] = "your message is deliver";

            return View();
        }



        public ActionResult ViewContact()
        {
            var query = db.Contacts.ToList();
            return View(query);
        }


    }
}