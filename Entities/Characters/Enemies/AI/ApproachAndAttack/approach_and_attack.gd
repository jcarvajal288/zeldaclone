class_name ApproachAndAttack extends Director

@export var subject: Character
@export var tile_distance_to_notice_player: int
@export var attack_range_pixels: int

var home_position: Vector2

func _ready() -> void:
	home_position = subject.position


func _process(_delta: float) -> void:
	self.reset()
	# if not in_same_cell_as_player() and subject.position != home_position:
	# 	subject.position = home_position
	# 	halt_subject()
	# 	return
	if not can_see_player():
		halt_subject()
		return
	if subject.position.distance_to(Global.PLAYER_POSITION) > attack_range_pixels:
		move_towards_player()
	else:
		attack_player()
		subject.velocity = Vector2.ZERO
	subject.move_and_slide()


func move_towards_player():
	movement_vector = subject.position.direction_to(Global.PLAYER_POSITION)


func attack_player():
	action_attack = true


func in_same_cell_as_player() -> bool:
	var this_cell = $CellFinder.get_cell_for_position(subject.position)
	var player_cell = $CellFinder.get_cell_for_position(Global.PLAYER_POSITION)
	return this_cell == player_cell


func can_see_player():
	var sight_distance = Global.MAP_TILE_SIZE * tile_distance_to_notice_player
	var distance_to_player = subject.position.distance_to(Global.PLAYER_POSITION)
	# return in_same_cell_as_player() and distance_to_player <= sight_distance
	return distance_to_player <= sight_distance

func halt_subject():
	movement_vector = Vector2.ZERO
