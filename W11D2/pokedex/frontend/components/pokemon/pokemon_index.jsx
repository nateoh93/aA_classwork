import React from 'react';

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
                <ul key={pokemon.id}>
                    <li>{pokemon.name}</li>
                    <img src={pokemon.image_url} />
                </ul>
            )
        })
        
        return(
            <div>
                {pokemonList}
            </div>
        )
    }
}

export default PokemonIndex;



// <picture>
//         <source media="(max-width: 400px)" srcSet={mobileView.url} />
//         <source media="(max-width: 900px)" srcSet={tabletView.url} />
//         <source srcSet={mainView.url} />
//         <img src={mainView.url} alt={mainView.alt} />
//       </picture>
