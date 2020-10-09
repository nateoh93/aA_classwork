import React from 'react';
import { Link } from 'react-router-dom';

class Greeting extends React.Component{
    constructor(props) {
        super(props);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) {
        e.preventDefault();
        this.props.logout();
    }

    render() {
        const welcomeMessage = () => {
            return (
                <div>
                    <h3>Welcome {this.props.currentUser.username}, you fine thing.</h3>
                    <button onClick={this.handleClick}>Logout</button>
                </div>
            )
        }

        const sessionLogin = () => {
            return (
                <div>
                    <Link to="/signup">Sign up boo!</Link>
                    <br/>
                    <Link to="/login">Sign in boy!</Link>
                </div>
            )
        }

        return (
            this.props.currentUser ? welcomeMessage() : sessionLogin()
        )
    }
} 

export default Greeting;