import React, { Component } from 'react';

export class Home extends Component {
    static displayName = Home.name;
    constructor(props) {
        super(props);
        this.state = JSON.parse(window.localStorage.getItem('state')) || { movies: [], loading: true, value: '' };

        this.handleChange = this.handleChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    setState(state) {
        window.localStorage.setItem('state', JSON.stringify(state));
        super.setState(state);
    }

    componentDidMount() {
        this.moviesData();
    }

    handleChange(event) {
        this.setState({ ...this.state, value: event.target.value })
    }

    handleSubmit(event) {}

    renderMoviesTable(movies) {
        return (
            <table className='table table-striped' aria-labelledby="tabelLabel">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Year</th>
                    </tr>
                </thead>
                <tbody>
                    {movies.map(movie =>
                        <tr key={movie.title}>
                            <td><a href={'movieinfo/' + movie.id}>{movie.title}</a></td>
                            <td>{movie.year}</td>
                        </tr>
                    )}
                </tbody>
            </table>
        );
    }

    render() {
        let contents = this.state.loading
            ? <p><em>Loading...</em></p>
            : this.renderMoviesTable(this.state.movies);

        return (
            <div>
                <form onSubmit={this.handleSubmit}>
                    <label>
                        <input name ="searchRequest" type="text" value={this.state.value} onChange={this.handleChange} />
                    </label>
                    <input type="submit" value="Submit" />
                </form>
                
                {contents}
            </div>
        );
    }
    
    async moviesData() {
        const response = await fetch('MovieList/?searchRequest=' + this.state.value);
        const data = await response.json();
        this.setState({ ...this.state, movies: data, loading: false })
    }
}