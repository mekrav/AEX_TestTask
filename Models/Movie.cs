using System.Collections.Generic;

namespace MovieSearcher.Models
{
    public class Movie
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public int Year { get; set; }
        public string Genre { get; set; }
        public string Description { get; set; }

        public virtual ICollection<MoviesActors> MoviesActors { get; set; }
    }
}
