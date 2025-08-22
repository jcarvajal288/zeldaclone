class_name Director extends Node

var movement_vector = Vector2.ZERO
var action_attack = false

@export var subject: Character
@export var tile_distance_to_notice_player: int

func reset() -> void:
	movement_vector = Vector2.ZERO
	action_attack = false


func move_towards_player():
	movement_vector = subject.global_position.direction_to(Global.PLAYER_POSITION)


func attack_player():
	action_attack = true
	movement_vector =Vector2.ZERO
	subject.animation_player.set_facing(subject.global_position.direction_to(Global.PLAYER_POSITION))


func can_see_player():
	var sight_distance = Global.MAP_TILE_SIZE * tile_distance_to_notice_player
	var distance_to_player = subject.global_position.distance_to(Global.PLAYER_POSITION)
	# return in_same_cell_as_player() and distance_to_player <= sight_distance
	return distance_to_player <= sight_distance


func halt():
	movement_vector = Vector2.ZERO


func player_beyond_range(pixel_range: int) -> bool:
	return subject.global_position.distance_to(Global.PLAYER_POSITION) > pixel_range