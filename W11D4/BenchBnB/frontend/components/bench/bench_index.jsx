import React from 'react';

class BenchIndex extends React.Component{
    componentDidMount() {
        this.props.fetchBenches();
    }

    render() {
        const benchList = this.props.benches.map( bench => {
            return <li key={bench.id}>{bench.description}</li>
        })        
        return(
            <div>
                <h1>List of Benches</h1>
                <ul>{benchList}</ul>
            </div>
        )
    }
}

export default BenchIndex;