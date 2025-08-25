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
	PROP = 1,
	WALL = 2,
	PLAYER = 5,
	EFFECT = 10,
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


const EAST_NORTH_EAST = -PI / 8
const NORTH_NORTH_EAST = -3 * PI / 8
const NORTH_NORTH_WEST = -5 * PI / 8
const WEST_NORTH_WEST = -7 * PI / 8
const EAST_SOUTH_EAST = PI / 8
const SOUTH_SOUTH_EAST = 3 * PI / 8
const SOUTH_SOUTH_WEST = 5 * PI / 8
const WEST_SOUTH_WEST = 7 * PI / 8

func convert_to_8_way(direction: Vector2) -> String:
	var angle = direction.angle()
	if EAST_NORTH_EAST < angle and angle <= EAST_SOUTH_EAST:
		return "Right" 
	elif EAST_SOUTH_EAST < angle and angle <= SOUTH_SOUTH_EAST:
		return "DownRight" 
	elif SOUTH_SOUTH_EAST < angle and angle <= SOUTH_SOUTH_WEST:
		return "Down" 
	elif SOUTH_SOUTH_WEST < angle and angle <= WEST_SOUTH_WEST:
		return "DownLeft" 
	elif NORTH_NORTH_EAST < angle and angle <= EAST_NORTH_EAST:
		return "UpRight" 
	elif NORTH_NORTH_WEST < angle and angle <= NORTH_NORTH_EAST:
		return "Up" 
	elif WEST_NORTH_WEST < angle and angle <= NORTH_NORTH_WEST:
		return "UpLeft" 
	else:
		return "Left" 