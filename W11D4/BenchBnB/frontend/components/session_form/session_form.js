import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component{
    constructor(props) {
        super(props);
        this.state = {
            username: "",
            password: ""
        }
        this.handleSubmit = this.handleSubmit.bind(this);
        this.update = this.update.bind(this);
    }

    handleSubmit(e) {
        e.preventDefault();
        const user = this.state;
        this.props.processForm(user);
        this.setState({
            username: "",
            password: ""
        })
    }

    update(type) {
        return(e) => {
            this.setState({[type] : e.target.value })
        }
    }

    render() {
        let link;

        if (this.props.formType === 'Login') {
            link = <Link to="/signup">Signup instead</Link>
        } else {
            link = <Link to="/login">Login instead</Link>
        }

        const renderError = this.props.errors.map( (error, idx) => {
            return <li key={idx}>{error}</li>
        })

        return(
            <form onSubmit={this.handleSubmit}>
                {link}
                <br/>
                <ul>{renderError}</ul>
                <br/>
                <label>Username:
                    <input type="text" onChange={this.update('username')} value={this.state.username}/>
                </label>
                <br/>
                <label>Password:
                    <input type="password" onChange={this.update('password')} value={this.state.password}/>
                </label>
                <input type="submit" value={this.props.formType}/>
            </form>
        )
    }
}

export default SessionForm