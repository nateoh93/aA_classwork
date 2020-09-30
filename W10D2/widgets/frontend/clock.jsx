import React from "react";

class Clock extends React.Component{
    constructor() {
        super();
        this.state = {time: new Date()};
        this.tick = this.tick.bind(this);
    }

    tick() {
        this.setState({time: new Date()});;
    }

    componentDidMount() {
        this.intervalId = setInterval(this.tick, 1000);
    }

    componentWillUnmount() {
        clearInterval(this.intervalId);
    }


    render() {
        return (
            <div>
                <h1>Clock</h1>
                <div className="clock">
                    <div className="date-row">
                        <span>Date:</span>
                        <span>{this.state.time.toDateString()}</span>
                    </div>
                    <div className="time-row">
                        <span>Time:</span>
                        <div>
                            <span id="red">
                                {this.state.time.getHours()}
                            </span>
                            <span>:</span>
                            <span id="blue">
                                {this.state.time.getMinutes()}
                            </span>
                            <span>:</span>
                            <span id="yellow">
                                {this.state.time.getSeconds()}
                            </span>
                        </div>
                        </div>
                </div>
            </div>
        )
    }
}

export default Clock;