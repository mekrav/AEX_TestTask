using Microsoft.EntityFrameworkCore;
using MovieSearcher.Models;
using System.Threading.Tasks;

namespace MovieSearcher
{
    public class ApplicationDbContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=localhost\SQLEXPRESS;Database=MovieSearcherDB;Trusted_Connection=True;MultipleActiveResultSets=True");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<MoviesActors>().HasKey(ma => new { ma.MovieId, ma.ActorId });
        }
        public ApplicationDbContext()
            : base()
        {
        }
        public DbSet<Movie> Movies { get; set; }
        public DbSet<Actor> Actors { get; set; }
        public DbSet<MoviesActors> MoviesActors { get; set; }
        /*
        public async Task<int> SaveChanges()
        {
            return await base.SaveChangesAsync();
        }
        */
    }
}
