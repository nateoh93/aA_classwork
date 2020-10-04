import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
    constructor(props) {
        super(props)
    };
    
    render() {
        const todos = this.props.todos;
        const receiveTodo = this.props.receiveTodo;

        const todoList = todos.map( (todo) => {
            return <TodoListItem key={todo.id} todo={todo}/>
        })

        return (
            <div>
                {/* <ul>testing</ul> */}
                <ul>{todoList}</ul>
                <TodoForm receiveTodo={receiveTodo}/>
            </div>
        )
    }
}

export default TodoList;