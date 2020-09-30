 import React from 'react';

class Tile extends React.Component {
    constructor(props) {
        super(props);
        this.handleClick = this.handleClick.bind(this);
    }
    
    handleClick(e){
        console.log("hi");
        let flag = e.altKey ? true : false;
        this.props.updateGame(this.props.tile, flag)
    }

    render() {
        let text;
        let tile = this.props.tile;

        if (tile.explored) {
            if (tile.bombed) {
                text = '\uD83D\uDCA3'; 
            } else {
                if (tile.adjacentBombCount() !== 0) {
                    text = `${tile.adjacentBombCount()}`;
                }
            }
        } else if (tile.flagged) {
            text = '\u2691';
        }
        
        return (
            <div className="tile" onClick={this.handleClick}>{text}</div>
        )
    }
}

export default Tile;