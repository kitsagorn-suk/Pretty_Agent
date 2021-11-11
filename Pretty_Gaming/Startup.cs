using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Pretty_Gaming.Startup))]
namespace Pretty_Gaming
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
