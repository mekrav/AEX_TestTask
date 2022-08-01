﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MovieSearcher.Models;
using MovieSearcher.DataAccess;
using MovieSearcher.DataAccess.Repositories;
using MovieSearcher.DataAccess.Entities;
using System.Collections.Generic;

namespace MovieSearcher.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class MovieController : ControllerBase
    {
        private readonly ILogger<MovieController> _logger;
        private readonly IMovieRepository movieRepository;

        public MovieController(ILogger<MovieController> logger)
        {
            _logger = logger;
            movieRepository = new MovieRepository();
        }

        [HttpGet]
        [Route("search")]
        public IEnumerable<Movie> Get([FromQuery] string q)
        {
            if (string.IsNullOrEmpty(q))
                return ConvertEntityToModel(movieRepository.AllMovies());

            return ConvertEntityToModel(movieRepository.FindMoviesBySimilarSubstringInInfo(q));
        }

        [HttpGet]
        [Route("id")]
        public Movie Get([FromQuery] int movieId)
        {
            return ConvertEntityToModel(movieRepository.FindMovieById(movieId));
        }

        private Movie ConvertEntityToModel(MovieEntity movieEntity)
        {
            if (movieEntity == null)
                return null;

            return new Movie()
            {
                Id = movieEntity.Id,
                Title = movieEntity.Title,
                Year = movieEntity.Year,
                Genre = movieEntity.Genre,
                Description = movieEntity.Description
            };
        }

        private IEnumerable<Movie> ConvertEntityToModel(IEnumerable<MovieEntity> movieEntities)
        {
            foreach(MovieEntity movieEntity in movieEntities)
                yield return ConvertEntityToModel(movieEntity);
        }
    }
}