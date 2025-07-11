extends Node

var game_controller: GameController
var level_manager: LevelManager
var rng: RandomNumberGenerator

var MAP_TILE_SIZE = 8
var MAP_CELL_SIZE = Vector2(MAP_TILE_SIZE * 20, MAP_TILE_SIZE * 15)
var PLAYER_POSITION = Vector2(0, 0)

enum Item {
	SmallKey
}

enum Alignment {
	GOOD,
	EVIL
}
