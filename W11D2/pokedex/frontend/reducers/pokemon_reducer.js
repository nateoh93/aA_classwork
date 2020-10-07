import {RECEIVE_ALL_POKEMON} from '../actions/pokemon_action';

const pokemonReducer = (state={}, action) => {
    Object.freeze(state);
    let nextState = Object.assign({}, state);
    
    switch (action.type) {
        case RECEIVE_ALL_POKEMON:
            // debugger
            nextState = action.pokemon;
            return nextState
        default:
            return state
    }
}

export default pokemonReducer