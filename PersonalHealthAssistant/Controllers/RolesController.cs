using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PersonalHealthAssistant.Models;

namespace PersonalHealthAssistant.Controllers
{
    public class RolesController : Controller
    {
        PersonalHealthAssistantEntities db = new PersonalHealthAssistantEntities();

        public ActionResult Index()
        {
            var query = db.Roles.ToList();

            return View(query);
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(Role r)
        {
            if (ModelState.IsValid)
            {

                db.Roles.Add(r);
                db.SaveChanges();
                TempData["msg"] = "Record Inserted";

                return RedirectToAction("Index");
            }
            else
            {
                TempData["msg"] = "Record Not Inserted";
            }


            return View();
        }

        public ActionResult Edit(int id)
        {
            var query = db.Roles.SingleOrDefault(m => m.Role_Id == id);
            return View(query);
        }

        [HttpPost]
        public ActionResult Edit(Role t)
        {

            if (ModelState.IsValid)
            {
                db.Entry(t).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");

            }

            else
            {
                TempData["msg"] = "Record Not Updated";
            }
            return View(t);
        }
        public ActionResult Delete(int id)
        {
            if (ModelState.IsValid)
            {
                var query = db.Roles.SingleOrDefault(m => m.Role_Id == id);
                db.Roles.Remove(query);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                TempData["msg"] = "Record Not Deleted";
            }

            return RedirectToAction("Index");
        }

    }
}