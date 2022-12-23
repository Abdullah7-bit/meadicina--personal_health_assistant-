using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PersonalHealthAssistant.Models;
using static PersonalHealthAssistant.Models.User;

namespace PersonalHealthAssistant.Controllers
{
    public class UsersController : Controller
    {
        PersonalHealthAssistantEntities db = new PersonalHealthAssistantEntities();

        public ActionResult AddUser()
        {


            List<Role> ls = db.Roles.ToList();
           
            ViewBag.roleList = new SelectList(ls, "Role_Id", "role_name");

            return View();
        }

        [HttpPost]

        public ActionResult AddUser(User u)
        { 

            List<Role> ls = db.Roles.ToList();
             
            ViewBag.roleList = new SelectList(ls, "Role_Id", "role_name");

            db.Users.Add(u);
            db.SaveChanges();

            return View();
        }

        public ActionResult ViewUser()
        {
            return View(db.Users.ToList());
        }

        public ActionResult Edit(int id)
        {
            var query = db.Users.SingleOrDefault(m => m.User_Id == id);
            return View(query);
        }

        [HttpPost]
        public ActionResult Edit(User t)
        {


            if (ModelState.IsValid)
            {


                db.Entry(t).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ViewUser");

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
                var query = db.Users.SingleOrDefault(m => m.User_Id == id);
                db.Users.Remove(query);
                db.SaveChanges();
                return RedirectToAction("ViewUser");
            }
            else
            {
                TempData["msg"] = "Record Not Deleted";
            }

            return RedirectToAction("ViewUser");
        }
    }
}