extends Node

var game_controller: GameController
var level_manager: LevelManager
var rng: RandomNumberGenerator
var bonfire_registry: BonfireRegistry

var MAP_TILE_SIZE = 8
var MAP_CELL_SIZE = Vector2(MAP_TILE_SIZE * 21, MAP_TILE_SIZE * 16)
var PLAYER_POSITION = Vector2(0, 0)

enum Item {
	SmallKey
}

enum Alignment {
	GOOD,
	EVIL
}

enum StairsDirection {
	EXIT_UP,
	EXIT_DOWN
}


enum RenderOrder {
	BASE = -2,
	FLOOR = 0,
	WALL = 2,
	PLAYER = 5,
	UI = 100
}

enum CollisionLayer {
	WALLS = 1,
	PLAYER = 2,
	TRIGGERS = 3,
	ITEMS = 4,
	ENEMY_BOUNDARY = 5,
	PITS = 6,
	PIT_BOUNDARY = 7
}

signal player_health_changed
signal fell_in_pit
signal fall_finished
signal transition_level
signal stairs_used
signal active_bonfire_changed