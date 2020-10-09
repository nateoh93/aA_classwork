import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = ({pokemon}) => {
    return(
        <li>
            <Link to={`/pokemon/${pokemon.id}`}>
                <span>{pokemon.name}</span>
                <img src={pokemon.image_url} />
            </Link>
        </li>
    )
}

export default PokemonIndexItem;