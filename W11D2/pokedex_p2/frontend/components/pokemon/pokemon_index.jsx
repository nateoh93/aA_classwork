import React from 'react';
import PokemonIndexItem from './pokemon_index_item'

class PokemonIndex extends React.Component {
    constructor(props) {
        super(props);
    }

    componentDidMount() {
        // console.log("does it reach")
        // debugger
        this.props.requestAllPokemon();
    }

    render() {
        const pokemonList = this.props.pokemon.map( pokemon => {
            return (
                <PokemonIndexItem key={pokemon.id} pokemon={pokemon}/>
            )
        })
        
        return(
            <div>
                <ul>{pokemonList}</ul>
            </div>
        )
    }
}

export default PokemonIndex;