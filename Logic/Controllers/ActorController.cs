using Microsoft.AspNetCore.Mvc;
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

        [HttpGet]
        public Actor Get([FromQuery] int actorId)
        {
            Actor actorResult;

            var context = new ApplicationDbContext();
            if (actorId <= 0)
                return null;

            actorResult = ConvertEntityToModel(context.Actors.First(a => a.Id == actorId));
            return actorResult;
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
    }
}