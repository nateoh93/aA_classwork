import React from 'react';
import GreetingContainer from './greeting/greeting_container'
import {Route} from 'react-router-dom';
import LoginFormContainer from './session_form/login_form_container';
import SingupFormContainer from './session_form/signup_form_container';
import SearchContainer from './search/search_container';
import {AuthRoute} from '../util/route_util'


const App = () => {
    return(
        <div>
            <header>
                <h1>Bench BnB</h1>
                <GreetingContainer />            
            </header>

            <AuthRoute exact path="/login" component={LoginFormContainer}/>
            <AuthRoute exact path="/signup" component={SingupFormContainer}/>
            
            <Route exact path="/" component={SearchContainer}/>
        </div>
    )
}

export default App;