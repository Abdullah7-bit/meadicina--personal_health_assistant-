using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PersonalHealthAssistant.Models;

namespace PersonalHealthAssistant.Controllers
{
    public class DoctorsController : Controller
    {
        // Databse Connectivity
        PersonalHealthAssistantEntities db = new PersonalHealthAssistantEntities();

        // GET: Doctors
        public ActionResult Index()
        {
            var query = db.Doctors.ToList();
            return View(query);
        }
        public ActionResult Add_Doctors()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Add_Doctors(Doctor adc)
        {

            if (ModelState.IsValid)
            {
                Doctor doc = new Doctor();
                doc.Name = adc.Name;
                doc.Education  = adc.Education;
                doc.Available_days = adc.Available_days;
                doc.Available_time = adc.Available_time;
                doc.Hospital = adc.Hospital;
                doc.Hospital_Address = adc.Hospital_Address;
                doc.City = adc.City;
                doc.Description = adc.Description;
                doc.Phone_number = adc.Phone_number;
                doc.Gender = adc.Gender;
                doc.Fees = adc.Fees;
                // doc.Image = adc.Image
                db.Doctors.Add(doc);
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