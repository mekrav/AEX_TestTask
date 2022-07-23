using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MovieSearcher.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MovieSearcher.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<WeatherForecast> Get()
        {
            var rng = new Random();
            string check = "No";
            using (var context = new ApplicationDbContext())
            {
                if (context.Database.CanConnect())
                    check = "Yep!!!";
                if (context.Database.EnsureCreated())
                    check = "Oh yep!!!";
                var movie = new Movie()
                {
                    Title = "bup",
                    Year = 2000 + rng.Next(0,22),
                    Genre = "Comedy",
                    Description = "bup, bup"
                };
                context.Movies.Add(movie);
                context.SaveChanges();
            }
            return Enumerable.Range(1, 10).Select(index => new WeatherForecast
            {
                Date = DateTime.Now.AddDays(index),
                TemperatureC = rng.Next(-20, 55),
                Summary = Summaries[rng.Next(Summaries.Length)] + " " + check
            }).ToArray();
        }
    }
}
