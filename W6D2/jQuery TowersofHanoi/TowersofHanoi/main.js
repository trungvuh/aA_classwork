const HanoiView = require('./view');
const HanoiGame = require('./game');

$( () => {
  const rootEl = $('.hanoi');
  const game = new HanoiGame();
  new HanoiView(game, rootEl);
});
