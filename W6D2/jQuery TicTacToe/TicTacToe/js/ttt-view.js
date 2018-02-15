

class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    $el.append(this.setupBoard());
    this.bindEvents();
  }

  bindEvents() {
    $('ul').on('click', 'li', (event) => {

      let $square = $(event.target);

      this.makeMove($square);
    });
  }


  makeMove($square) {
    let pos = $square.data("pos");
    if (this.game.board.isEmptyPos(pos)){
      $square.append(this.game.currentPlayer);
      this.game.playMove(pos);
      $square.addClass("white");
      this.gameOver();
    } else {
      alert("NOT VALID MOVE");
    }
  }

  gameOver(){
    if (this.game.isOver()) {
      let winner = this.game.winner();
      $('ul').children().each((idx,ele) => {
        let $square = $(ele);
        if ($square.text() === winner){
          $square.addClass("won");
        } else {
          $square.addClass("lost");
        }
      });

      $('ul').off('click','li');
      $('ul').append(`<p> You win, ${winner}</p>`);
    }
  }

  setupBoard() {
    let grid = $("<ul>");

    // for (var i = 0; i < 9; i++) {
    //   grid.append("<li>");
    // }
    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {
      for (let colIdx = 0; colIdx < 3; colIdx++) {
        let $square = $("<li>");
        $square.data("pos", [rowIdx,colIdx]);
        grid.append($square);
      }
    }
    return grid;
  }
}

module.exports = View;
