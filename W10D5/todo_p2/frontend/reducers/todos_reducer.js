import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';

const todosReducer = (state=initialState, action) => {
    Object.freeze(state);
    const nextState = Object.assign({}, state);

    switch(action.type) {
        case RECEIVE_TODOS:
            action.todos.forEach( todo => {
                nextState[todo.id] = todo;
            })
            return nextState;
        case RECEIVE_TODO:
            nextState[action.todo.id] = action.todo;
            return nextState;
        default:
            return state;
    }
}

// Sample code to test
const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
    }
};

// const newTodos4 = [ 
//     {
//         id: 1,
//         title: "sell car",
//         body: "get cash",
//         done: false
//     },
//     {
//         id: 2,
//         title: "feed dog",
//         body: "with apples",
//         done: true
//     }
// ];


export default todosReducer;