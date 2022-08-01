using System.Collections.Generic;

namespace MovieSearcher.DataAccess.Entities
{
    public class MovieEntity
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public int Year { get; set; }
        public string Genre { get; set; }
        public string Description { get; set; }

        public virtual ICollection<ActorMovieLinkEntity> MoviesActors { get; set; }
    }
}
