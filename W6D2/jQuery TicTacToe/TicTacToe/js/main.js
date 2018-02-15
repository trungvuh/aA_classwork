const View = require('./ttt-view');
const Game = require('./game');

$( () => {
  let game = new Game();
  let container = $('.ttt');
  let view = new View(game, container);
  
});
