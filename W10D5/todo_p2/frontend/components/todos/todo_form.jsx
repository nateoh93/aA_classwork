import React from 'react';

class TodoForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            title: "",
            body: "",
            done: false,
            id: Math.floor(Math.random() * 1000)
        };
        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    updateTitle(e) {
        this.setState({title: e.target.value})
    }

    updateBody(e) {
        this.setState({ body: e.target.value })
    }

    handleSubmit(e) {
        e.preventDefault();

        const todo = this.state;

        this.props.receiveTodo(todo);
        
        this.setState({
            title: "",
            body: "",
            done: false,
            id: Math.floor(Math.random() * 1000)
        });
    }

    render() {
        return (
            <form onSubmit={this.handleSubmit}>
                <h3>Add a new Todo</h3>
                <label>Title:
                    <input type="text" onChange={this.updateTitle} value={this.state.title}/>
                </label>
                <label>Body:
                    <textarea cols="30" rows="10" onChange={this.updateBody} value={this.state.body}></textarea>
                </label>
                <input type="submit" value="Add todo!"/>
            </form>
        )
    }
}

export default TodoForm;