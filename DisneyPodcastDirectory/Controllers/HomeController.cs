using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DisneyPodcastDirectory.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "This Disney Podcast Directory " +
                              "is an UNOFFICAL directory of Disney podcasts. It contains " +
                              "both fan created podcasts and Official Disney podcasts.";

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Brief description of the site.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Ways to contact the site.";

            return View();
        }

        public ActionResult Updates()
        {
            ViewBag.Message = "A quick rundown of changes to the site over it's history.";

            return View();
        }
    }
}