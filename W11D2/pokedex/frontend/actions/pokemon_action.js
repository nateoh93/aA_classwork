import {fetchAllPokemon} from '../util/pokemon_util'

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON"

export const receiveAllPokemon = (pokemon) => {
    return ({
        type: RECEIVE_ALL_POKEMON,
        pokemon
    })
}

export const requestAllPokemon = () => {
    return (dispatch => {
        return (
            fetchAllPokemon()
                .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
        )
    })
}