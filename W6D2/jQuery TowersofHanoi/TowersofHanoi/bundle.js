/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const HanoiView = __webpack_require__(1);
const HanoiGame = __webpack_require__(2);

$( () => {
  const rootEl = $('.hanoi');
  const game = new HanoiGame();
  new HanoiView(game, rootEl);
});


/***/ }),
/* 1 */
/***/ (function(module, exports) {


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


/***/ }),
/* 2 */
/***/ (function(module, exports) {

class Game {
  constructor() {
    this.towers = [[3, 2, 1], [], []];
  }

  isValidMove(startTowerIdx, endTowerIdx) {
      const startTower = this.towers[startTowerIdx];
      const endTower = this.towers[endTowerIdx];

      if (startTower.length === 0) {
        return false;
      } else if (endTower.length == 0) {
        return true;
      } else {
        const topStartDisc = startTower[startTower.length - 1];
        const topEndDisc = endTower[endTower.length - 1];
        return topStartDisc < topEndDisc;
      }
  }

  isWon() {
      // move all the discs to the last or second tower
      return (this.towers[2].length === 3) || (this.towers[1].length === 3);
  }


  move(startTowerIdx, endTowerIdx) {
      if (this.isValidMove(startTowerIdx, endTowerIdx)) {
        this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
        return true;
      } else {
        return false;
      }
  }

  print() {
      console.log(JSON.stringify(this.towers));
  }

  promptMove(reader, callback) {
      this.print();
      reader.question("Enter a starting tower: ", start => {
        const startTowerIdx = parseInt(start);
        reader.question("Enter an ending tower: ", end => {
          const endTowerIdx = parseInt(end);
          callback(startTowerIdx, endTowerIdx);
        });
      });
  }

  run(reader, gameCompletionCallback) {
      this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
        if (!this.move(startTowerIdx, endTowerIdx)) {
          console.log("Invalid move!");
        }

        if (!this.isWon()) {
          // Continue to play!
          this.run(reader, gameCompletionCallback);
        } else {
          this.print();
          console.log("You win!");
          gameCompletionCallback();
        }
      });
  }
}

module.exports = Game;


/***/ })
/******/ ]);