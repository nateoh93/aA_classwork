import React from 'react';
import Tile from './tile'

class Board extends React.Component {
    constructor(props) {
        super(props);
    }
    
    render() {
        return(
            <div className="board-grid">
                {this.props.board.grid.map((row,idx1) => {
                    return <div className="row" key={idx1}>{row.map((tile, idx2) => {
                        return (<Tile tile={tile} updateGame={this.props.updateGame} key={idx2} />)
                    })}</div> 
                })}
            </div>
        )
    }   
}

export default Board;