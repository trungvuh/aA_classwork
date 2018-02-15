
class HanoiView {
  constructor (game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupTowers();
    this.render();
    this.clickTower();
  }

  setupTowers() {
    let $board = $("<ul>");

    for (var i = 0; i < 3; i++) {
      let $pile = $("<li>");
      if (i === 0) {
        $pile.addClass("first");
      }
      else if (i === 1) {
        $pile.addClass("second");
      }
      else {
        $pile.addClass("third");
      }

      $pile.data("pos", i);
      $pile.append("<p>");
      $board.append($pile);
    }
    this.$el.append($board);
  }

  render() {
    let disc1 = $("<div>").addClass("one");
    let disc2 = $("<div>").addClass("two");
    let disc3 = $("<div>").addClass("three");
    $(".first p").before(disc1,disc2,disc3);

  }

  clickTower() {
    $("li").on("click", event => {
      if (this.move === undefined) {
        this.move = $(event.currentTarget).data("pos");
      } else {
        this.makeMove(this.move, $(event.currentTarget).data("pos"));
      }
    });
  }

  makeMove(start,end){
    let startClass = this.pileSelector(start);
    let endClass = this.pileSelector(end);

    if (this.game.move(start,end)) {
      let $disc = $(startClass).children(':first-child');

      $(endClass).children(':first-child').before($disc);
      // $(startClass).children(':first-child').remove();
    } else {
      alert("NOT VALID MOVE");
    }

    this.move = undefined;
    this.wonHanoi();
  }

  wonHanoi() {

    if (this.game.isWon()) {
      $("div").css("background", "red");
      $("li").off("click");
      alert("YOU WON");
    }
  }

  pileSelector(num){
    if (num === 0) {
      return ".first";
    } else if (num === 1){
      return ".second";
    } else {
      return ".third";
    }
  }

}
module.exports = HanoiView;
