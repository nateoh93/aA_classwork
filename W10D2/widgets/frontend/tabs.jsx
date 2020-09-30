import React from "react";

class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.state = {tab: 0};
        this.changeTab = this.changeTab.bind(this);
    }

    // what should clicking do = function to do this, w/ variable
    // click handling

    changeTab(tab) {
        this.setState({tab: tab});
    }

    render() {
        return(
            <div>
                <h1>Tabs</h1>
                <ul className="tab">
                    {this.props.tabs.map((element, index) => {
                        return <h2 onClick={() => this.changeTab(index)} key={index}>{element.title}</h2>
                    })}

                    <article>{this.props.tabs[this.state.tab].content}</article>
                </ul>
            </div>
        );
    }
}

export default Tabs;