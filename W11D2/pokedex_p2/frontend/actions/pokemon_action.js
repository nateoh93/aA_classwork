import {fetchAllPokemon, fetchPokemon} from '../util/pokemon_util'

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON"
export const RECEIVE_POKEMON = "RECEIVE_POKEMON"

export const receiveAllPokemon = (pokemon) => {
    return ({
        type: RECEIVE_ALL_POKEMON,
        pokemon
    })
}

export const receivePokemon = (payload) => {
    return ({
        type: RECEIVE_POKEMON,
        payload
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

export const requestPokemon = (id) => {
    return (dispatch => {
        return (
            fetchPokemon(id)
                .then(pokemon => dispatch(receivePokemon(pokemon)))
        )
    })
}