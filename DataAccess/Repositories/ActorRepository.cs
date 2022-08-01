using System.Collections.Generic;
using System.Linq;
using MovieSearcher.DataAccess.Entities;

namespace MovieSearcher.DataAccess.Repositories
{
    public class ActorRepository : IActorRepository
    {
        public ActorEntity FindActorById(int id)
        {
            var context = new ApplicationDbContext();
            if (id <= 0)
                return null;

            return context.Actors.First(m => m.Id == id);
        }

        public IEnumerable<ActorEntity> ActorsByMovieId(int movieId)
        {
            var context = new ApplicationDbContext();

            var actorList =
                (from moviesActors in context.ActorMovieLink
                 join actor in context.Actors on moviesActors.ActorId equals actor.Id
                 where moviesActors.MovieId == movieId
                 select actor).Distinct();

            return actorList;
        }
    }

    public interface IActorRepository
    {
        ActorEntity FindActorById(int id);
        IEnumerable<ActorEntity> ActorsByMovieId(int movieId);
    }
}