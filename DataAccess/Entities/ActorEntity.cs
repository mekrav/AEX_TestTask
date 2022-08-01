using System;
using System.Collections.Generic;

namespace MovieSearcher.DataAccess.Entities
{
    public class ActorEntity
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime BirthDate { get; set; }

        public virtual ICollection<ActorMovieLinkEntity> MoviesActors { get; set; }
    }
}

