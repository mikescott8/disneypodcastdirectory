using System.Collections.Generic;
using System.Text;
using FeedLister;

namespace DisneyPodcastDirectory.Helper
{
    public static class OutlineListExtensions
    {
        public static void AddOutline(this List<string> cats, string fillText, Outline outline)
        {
            var sb = new StringBuilder(fillText);
            sb.Append(outline.Text);
            switch (outline.Type)
            {
                case "rss":
                    sb.Append(";podcast feed: " + outline.XmlUrl);
                    break;
                case "link":
                    sb.Append(";html url: " + outline.Url);
                    break;
            }

            cats.Add(sb.ToString());
        }

        public static void AddOutlines(this List<string> cats, string fillText, Outline[] outlines)
        {
            if (outlines != null)
            {
                foreach (var outline in outlines)
                {
                    //AddOutlineToList(cats, fillText, outline);
                    cats.AddOutline(fillText, outline);

                    if (outline.Outlines != null)
                    {
                        cats.AddOutlines(
                            (string.IsNullOrWhiteSpace(fillText) ? ":-->" : fillText + fillText),
                            outline.Outlines);
                    }
                }
            }
        }
    }
}