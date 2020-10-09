import React from "react";
import ReactDOM from "react-dom";
import configureStore from './store/store';
import Root from './components/root'

//testing start
import { logoutUser, loginUser, signupUser } from "./util/session_api_util";
import { logout, login, signup } from "./actions/session_actions";
import { fetchBenches } from "./actions/bench_actions";
//testing end

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    let store;

    if (window.currentUser) {
        const preloadedState = {
            entities: {
                users: {[window.currentUser.id] : window.currentUser}
            },
            session: {id: window.currentUser.id}
        };
        store = configureStore(preloadedState);
        delete window.currentUser;
    } else {
        store = configureStore();
    }
    
    ReactDOM.render(<Root store={store}/>, root);

    //testing start
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    window.loginUser = loginUser
    window.logoutUser = logoutUser
    window.signupUser = signupUser
    window.logout = logout
    window.login = login
    window.signup = signup
    window.fetchBenches = fetchBenches
    //testing end
});