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
    public class MovieListController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<MovieListController> _logger;

        public MovieListController(ILogger<MovieListController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<Movie> Get()
        {
            Movie[] movieList;
            using (var context = new ApplicationDbContext())
            {
                context.Database.EnsureCreated();
                movieList = context.Movies.ToArray();
            }
            return movieList;
        }

        [HttpGet("{searchRequest}")]
        public IEnumerable<Movie> Get(string searchRequest)
        {
            Movie[] movieList;
            using (var context = new ApplicationDbContext())
            {
                movieList = context.Movies.ToArray();
            }
            return movieList;
        }
    }
}
