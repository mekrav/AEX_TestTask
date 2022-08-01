using Microsoft.EntityFrameworkCore;
using MovieSearcher.DataAccess.Entities;

namespace MovieSearcher.DataAccess
{
    public class ApplicationDbContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"CONNECTION_STRING");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ActorMovieLinkEntity>().HasKey(ma => new { ma.MovieId, ma.ActorId });
        }
        public ApplicationDbContext()
            : base()
        {
        }

        public DbSet<MovieEntity> Movies { get; set; }
        public DbSet<ActorEntity> Actors { get; set; }
        public DbSet<ActorMovieLinkEntity> ActorMovieLink { get; set; }
    }
}
