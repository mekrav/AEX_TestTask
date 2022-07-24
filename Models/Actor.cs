using System;
using System.Collections.Generic;

namespace MovieSearcher.Models
{
    public class Actor
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime BirthDate { get; set; }
        public string Bio { get; set; }

        public virtual ICollection<MoviesActors> MoviesActors { get; set; }
    }
}
