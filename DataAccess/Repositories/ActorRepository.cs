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
    }

    public interface IActorRepository
    {
        ActorEntity FindActorById(int id);
    }
}