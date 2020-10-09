import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root'
// import { HashRouter, Route } from 'react-router-dom';

//for testing. remove later
import {fetchAllPokemon, fetchPokemon} from './util/pokemon_util'
import {receivePokemon, receiveAllPokemon} from './actions/pokemon_action'

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    const rootEl = document.getElementById('root');
    ReactDOM.render(<Root store={store}/>, rootEl);
    
    //for testing. remove later
    window.store = store
    window.fetchPokemon = fetchPokemon
    window.fetchAllPokemon = fetchAllPokemon
    window.receivePokemon = receivePokemon
    window.receiveAllPokemon = receiveAllPokemon

});