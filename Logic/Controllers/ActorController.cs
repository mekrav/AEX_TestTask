﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MovieSearcher.Models;
using MovieSearcher.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using MovieSearcher.DataAccess.Repositories;
using MovieSearcher.DataAccess.Entities;

namespace MovieSearcher.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ActorController : ControllerBase
    {
        private readonly ILogger<MovieController> _logger;
        private readonly IActorRepository actorRepository;

        public ActorController(ILogger<MovieController> logger)
        {
            _logger = logger;
            actorRepository = new ActorRepository();
        }

        /// <summary>
        /// Get actor data by id
        /// </summary>
        /// <param name="actorId"></param>
        /// <returns>Actor object by id</returns>
        [HttpGet]
        public Actor Get([FromQuery] int actorId)
        {
            return ConvertEntityToModel(actorRepository.FindActorById(actorId));
        }

        /// <summary>
        /// Get movie cast by movieId
        /// </summary>
        /// <param name="movieId"></param>
        /// <returns>Lict of actors in movie by it's id</returns>
        [HttpGet]
        [Route("inMovie")]
        public IEnumerable<Actor> Cast([FromQuery] int movieId)
        {
            return ConvertEntityToModel(actorRepository.ActorsByMovieId(movieId));
        }

        private Actor ConvertEntityToModel(ActorEntity actorEntity)
        {
            if (actorEntity == null)
                return null;

            return new Actor()
            {
                Id = actorEntity.Id,
                Name = actorEntity.Name,
                BirthDate = actorEntity.BirthDate
            };
        }

        private IEnumerable<Actor> ConvertEntityToModel(IEnumerable<ActorEntity> actorEntities)
        {
            foreach (ActorEntity actorEntity in actorEntities)
                yield return ConvertEntityToModel(actorEntity);
        }
    }
}