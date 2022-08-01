using System.Collections.Generic;
using System.Linq;
using MovieSearcher.DataAccess;
using MovieSearcher.DataAccess.Entities;
namespace MovieSearcher.DataAccess.Repositories
{

    public class MovieRepository : IMovieRepository
    {
        public IEnumerable<MovieEntity> AllMovies()
        {
            var context = new ApplicationDbContext();
            return context.Movies.ToArray();
        }

        public MovieEntity FindMovieById(int id)
        {
            var context = new ApplicationDbContext();
            if (id <= 0)
                return null;
            
            return context.Movies.First(m => m.Id == id);
        }

        public IEnumerable<MovieEntity> FindMoviesBySimilarSubstringInInfo(string request)
        {
            var context = new ApplicationDbContext();

            var movieList =
                (from movie in context.Movies
                 join moviesActors in context.ActorMovieLink on movie.Id equals moviesActors.MovieId
                 join actor in context.Actors on moviesActors.ActorId equals actor.Id
                 where actor.Name.Contains(request) || movie.Title.Contains(request) || movie.Genre.Contains(request)
                 select movie).Distinct();

            return movieList;
        }
    }

    public interface IMovieRepository
    {
        IEnumerable<MovieEntity> AllMovies();
        MovieEntity FindMovieById(int id);
        IEnumerable<MovieEntity> FindMoviesBySimilarSubstringInInfo(string name);
    }
}
