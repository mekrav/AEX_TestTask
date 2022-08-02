# AEX_TestTask

# Task

Develop a web application for searching and displaying information about movies. Application should include the ability to search movies by one or more criteria and display information about the selected movie. 

**Functional requirements**: Each movie must be associated with one or more actors. The search for a movie should work by title, genre, or actor name. The search result must be displayed on the same page below the search form. 

**Technical requirements**: 
 * The backend part should be implemented in .Net Core. 
 * MS SQL Server or MS SQL Server Express should be used as a database.
 * Entity Framework Core should be used as an ORM. 
 * The frontend part should be implemented in React. Using of modern css/less/sass frameworks will be an additional advantage. 
 * Presence of tests will an additional advantage. 
 * Documentation regarding the description of functionality and deployment process is required. 
 * All comments and documentation should be written in English.
 
## Progress
* React part isn't ready. It was my first experience of using React and this experience wasn't so good.
* API is ready. We need only 4 get requests!!
* Documentation. Hmmm... Swagger worked, but then I did something with routing in React part and Swagger isn't working.
* Deployment part. Honestly, I never worked with deployment and I waste a lot of time trying to learn something for React part. So I haven't any deployment.

## API
* `/movie?id=[movieId]` 
  Get request. Get movie by id.
* `/movie/search?q=[Your request]` 
  Get request. Search movie by name, genre, actor name.
* `/actor?id=[actorId]` 
  Get request. Get actor by id.
* `/actor/inmovie?movieid=[movieId]`
  Get request. Get cast of movie by it's id.
