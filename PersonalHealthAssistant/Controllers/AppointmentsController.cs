using PersonalHealthAssistant.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace PersonalHealthAssistant.Controllers
{
    public class AppointmentsController : Controller
    {

        PersonalHealthAssistantEntities db = new PersonalHealthAssistantEntities();

        // GET: Appointments
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Book_Appointment()
        {
            List<Doctor> ls = db.Doctors.ToList();

            ViewBag.timeList = new SelectList(ls, "Doc_Id", "role_name");

            return View();
        }


        [HttpPost]
        public ActionResult Book_Appointment(Appointment ap)
        {

            List<Doctor> ls = db.Doctors.ToList();

            ViewBag.timeList = new SelectList(ls, "Doc_Id", "role_name");

            db.Appointments.Add(ap);
            db.SaveChanges();

            return View();
        }


    }
}