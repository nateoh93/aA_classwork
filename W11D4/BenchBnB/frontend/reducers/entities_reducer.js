import usersReducer from './users_reducer'
import {combineReducers} from 'redux';
import benchesReducer from './benches_reducer'

const entitiesReducer = combineReducers({
    users: usersReducer,
    benches: benchesReducer
})

export default entitiesReducer;