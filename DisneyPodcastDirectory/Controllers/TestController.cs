using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using System.Xml.Linq;
using DisneyPodcastDirectory.Helper;
using FeedLister;

namespace DisneyPodcastDirectory.Controllers
{
    public class TestController : ApiController
    {
        public object Get()
        {
            var opmlDocumentPath = Path.Combine(
                AppDomain.CurrentDomain.GetData("DataDirectory").ToString(),
                "ExtinctPodcastsdata.xml");
            var opmlDocument = OpmlDocument.Load(opmlDocumentPath);

            var cats = new List<string>();

            cats.AddOutlines(string.Empty, opmlDocument.Body.Outlines);

            return cats.ToArray();
        }

    }
}
