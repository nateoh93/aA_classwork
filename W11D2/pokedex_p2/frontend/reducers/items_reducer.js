import { RECEIVE_POKEMON } from "../actions/pokemon_action";

const itemsReducer = (state={}, action) => {
    Object.freeze(state);
    let newState = Object.assign({}, state);
    switch (action.type) {
        case RECEIVE_POKEMON:
            newState[action.payload.items.id] = action.payload.items
            return 
        default:
            return state;
    }
}

export default itemsReducer