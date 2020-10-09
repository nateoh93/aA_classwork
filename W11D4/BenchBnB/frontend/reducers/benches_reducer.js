import {RECEIVE_BENCHES} from '../actions/bench_actions'

const benchesReducer = (state={}, action) => {
    Object.freeze(state);
    let nextState = Object.assign({}, state);
    switch (action.type) {
        case RECEIVE_BENCHES:
            let nextState
            return action.benches
        default:
            return state;
    }
}

export default benchesReducer