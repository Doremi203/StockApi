using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

public class Startup
{
    public Startup(IConfiguration configuration)
    {
        
    }

    public void ConfigureServices(IServiceCollection services)
    {
        
    }

    public void Configure(IApplicationBuilder app, IWebHostEnvironment environment)
    {
        app.UseRouting();
        app.UseEndpoints(endpoints => {});
    }
}