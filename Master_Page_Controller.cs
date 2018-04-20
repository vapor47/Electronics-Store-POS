using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using POS_WEB_APP.Models;

namespace POS_WEB_APP.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Create_Transaction()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult View_Reports()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Check_Inventory()

        {
            return View();
        }

        public IActionResult Customer_Lookup()

        {
            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
