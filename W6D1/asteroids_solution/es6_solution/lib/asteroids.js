//this is the main entry file (main.js)

const Game = require("./game");
const GameView = require("./game_view");

document.addEventListener("DOMContentLoaded", () => {
  const canvasEl = document.getElementsByTagName("canvas")[0];
  canvasEl.width = Game.DIM_X;
  canvasEl.height = Game.DIM_Y;

  const ctx = canvasEl.getContext("2d");

  //create a new game
  const game = new Game();

  //take that game, and "render" it on the context(which is a 2d canvas), then start the game
  new GameView(game, ctx).start();
});
