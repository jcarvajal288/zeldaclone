extends Node

@export var subject: Character
@export var animation_player: AnimationPlayer
@export var tile_distance_to_notice_player: int
@export var attack_range_pixels: int

var home_position: Vector2

func _ready() -> void:
	home_position = subject.position


func _process(_delta: float) -> void:
	if not in_same_cell_as_player() and subject.position != home_position:
		subject.position = home_position
		halt_subject()
		return
	if not can_see_player():
		halt_subject()
		return
	if not animation_player.animation_locked:
		if subject.position.distance_to(Global.PLAYER_POSITION) > attack_range_pixels:
			move_towards_player()
		else:
			attack_player()
			subject.velocity = Vector2.ZERO
	subject.move_and_slide()


func move_towards_player():
	var direction_to_player = subject.position.direction_to(Global.PLAYER_POSITION)
	subject.velocity = subject.speed * direction_to_player
	animation_player.set_facing(direction_to_player)
	animation_player.play_move_animation()


func attack_player():
	var direction_to_player = subject.position.direction_to(Global.PLAYER_POSITION)
	animation_player.play_attack_animation_with_direction(direction_to_player)



func in_same_cell_as_player() -> bool:
	var this_cell = $CellFinder.get_cell_for_position(subject.position)
	var player_cell = $CellFinder.get_cell_for_position(Global.PLAYER_POSITION)
	return this_cell == player_cell


func can_see_player():
	var sight_distance = Global.MAP_TILE_SIZE * tile_distance_to_notice_player
	var distance_to_player = subject.position.distance_to(Global.PLAYER_POSITION)
	return in_same_cell_as_player() and distance_to_player <= sight_distance

func halt_subject():
	subject.velocity = Vector2.ZERO
	animation_player.play_random_idle_animation()
