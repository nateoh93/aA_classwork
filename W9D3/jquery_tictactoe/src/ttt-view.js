class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    const that = this;
    this.$el.on("click", "li", function(event) {
      that.makeMove($(event.target));
    })
  }
  
  makeMove($square) {
    let current = this.game.currentPlayer;
    // debugger
    let pos = $square.data("pos");
    if (!this.game.board.isEmptyPos(pos)) {
      alert('Is not an empty position!');
      // return;
    } else {
      this.game.playMove(pos);
    }

    $square.addClass(current)

    let winner = this.game.winner()
    let $p = $("<p>");

    if (this.game.isOver()) {
      this.$el.off("click");
      this.$el.addClass("game-over");
      if (winner) {
        this.$el.addClass(`winner-${current}`)
        $p.text(`You win, ${current.toUpperCase()} !`)
      } else{
        $p.text(`It's a draw!`)

      }
      this.$el.append($p)
    }
  }

  setupBoard() {
    let $ul = $("<ul>");

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let $li = $("<li>");
        $li.data("pos", [i, j]);
        $ul.append($li);
      }
    }
    this.$el.append($ul)
  }
}


module.exports = View;