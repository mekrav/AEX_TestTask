namespace MovieSearcher.DataAccess.Entities
{
    public class ActorMovieLinkEntity
    {
        public int MovieId { get; set; }
        public MovieEntity Movie { get; set; }

        public int ActorId { get; set; }
        public ActorEntity Actor { get; set; }
    }
}
