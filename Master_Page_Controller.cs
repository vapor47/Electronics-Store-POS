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

            return View();
        }

        public IActionResult View_Reports()
        {

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

        public IActionResult Vendor_Lookup()
        {
            return View();
        }

        public IActionResult Product_Lookup()
        {
            return View();
        }
    }
}
