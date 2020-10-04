import React from 'react'
import ReactDom from 'react-dom'
import configureStore from './store/store'
import {receiveTodos, receiveTodo} from './actions/todo_actions'
import Root from './components/root'
import {allTodos} from './reducers/selectors'

document.addEventListener('DOMContentLoaded', () => {
    const rootEl = document.getElementById('root');
    const store = configureStore();
    window.store = store; 
    window.receiveTodos = receiveTodos; 
    window.receiveTodo = receiveTodo; 
    window.allTodos = allTodos;

    ReactDom.render(<Root store={store} />, rootEl)
})