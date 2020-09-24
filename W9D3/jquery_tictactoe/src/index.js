const View = require("./ttt-view"); // require appropriate file
const Game = require("./game"); // require appropriate file

  $(() => {
    // Your code here
    const rootEle = $('.ttt');
    const newGame = new Game();
    new View(newGame, rootEle);
  });

// establish new game
// grab root element to attach html to
// pass root element as jquery and game into view