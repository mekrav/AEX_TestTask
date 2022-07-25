using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MovieSearcher.Models;
using System;
using System.Collections.Generic;
using System.Linq;

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
        public IEnumerable<Movie> Get([FromQuery] string searchRequest)
        {
            IEnumerable<Movie> movieList;

            var context = new ApplicationDbContext();
            if (string.IsNullOrEmpty(searchRequest))
            {
                movieList = context.Movies.ToArray();
            }
            else
            { 
                movieList =
                    (from movie in context.Movies
                    join moviesActors in context.MoviesActors on movie.Id equals moviesActors.MovieId
                    join actor in context.Actors on moviesActors.ActorId equals actor.Id
                    where actor.Name.Contains(searchRequest) || movie.Title.Contains(searchRequest) || movie.Genre.Contains(searchRequest)
                    select movie).Distinct();
            }
            return movieList;
        }
    }
}
