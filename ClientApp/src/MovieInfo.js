import React, { useState, useEffect } from 'react';
import { useParams } from "react-router-dom";

export function MovieInfo() {
    const [isLoad, setIsLoad] = useState(false);
    const [movie, setMovie] = useState({title: "a", year: 2, genre: "b", description: "c"});
    const { id } = useParams();

    useEffect(() => {
        const data = fetch('MovieData?movieId=' + id).then(res => res.json);
        setMovie(data);
        setIsLoad(true)
    }, []);


    let info = isLoad
        ? <p>{id}</p>
        : <p><em>Loading...</em></p>;

    return (
        <div>
            {info}
        </div>
    );
}