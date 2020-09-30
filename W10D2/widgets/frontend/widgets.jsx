import ReactDOM from "react-dom";
import React from "react";
import Clock from './clock';
import Tabs from './tabs';
import Weather from './weather';

const tabs = [
    {"title": "one", "content": "i am the first"},
    {"title": "two", "content": "second pane here"},
    {"title": "three", "content": "third pane here"}
];

function Root() {
    return (
        <div>
            <div>
                <Clock/>
            </div>
        
            <div>
                <Weather/>
            </div>

            <div>
                <Tabs tabs={tabs}/>
            </div>
        </div>
        
    );
};

document.addEventListener("DOMContentLoaded", () => {
    const main = document.getElementById("main")
    ReactDOM.render(<Root/>, main);
})

