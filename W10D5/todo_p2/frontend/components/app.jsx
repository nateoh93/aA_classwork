import React from 'react';
import ToDoListContainer from './todos/todo_list_container'

const App = (props) => {
    return (
        <div>
            <h1>Todos App</h1>
            <ToDoListContainer />
        </div>
    )
}

export default App;