extends Node

var game_controller: GameController
var level_manager: LevelManager
var rng: RandomNumberGenerator

var MAP_CELL_SIZE = Vector2(160, 120)

enum Item {
	SmallKey
}

enum Alignment {
	GOOD,
	EVIL
}
