using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DisneyPodcastDirectory.Startup))]
namespace DisneyPodcastDirectory
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
