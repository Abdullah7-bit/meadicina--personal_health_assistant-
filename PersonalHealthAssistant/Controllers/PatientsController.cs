using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PersonalHealthAssistant.Models;

namespace PersonalHealthAssistant.Controllers
{
    public class PatientsController : Controller
    {
        // Databse Connectivity
        PersonalHealthAssistantEntities db = new PersonalHealthAssistantEntities();

        // GET: Patients
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add_Patients()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Add_Patients(Patient pat)
        {

            if (ModelState.IsValid)
            {
                Patient pts = new Patient();
                pts.Name = pat.Name;
                pts.Address = pat.Address;
                pts.City = pat.City;
                pts.Phone_number = pat.Phone_number;
                pts.Gender = pat.Gender;
                pts.Age = pat.Age;              
              
                // pts.Image = pat.Image
                db.Patients.Add(pts);
                db.SaveChanges();
                TempData["Success_message"] = "Data Inserted Successfully";

                return RedirectToAction("");

            }
            else
            {
                TempData["Error_message"] = "Not Inserted";
            }
            return View();
        }




    }
}