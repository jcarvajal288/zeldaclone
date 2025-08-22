class_name ApproachAndAttack extends Director

@export var attack_range_pixels: int

var home_position: Vector2

func _ready() -> void:
	home_position = subject.position


func _process(_delta: float) -> void:
	reset()
	# if not in_same_cell_as_player() and subject.position != home_position:
	# 	subject.position = home_position
	# 	halt_subject()
	# 	return
	if not can_see_player():
		halt()
	elif player_beyond_range(attack_range_pixels):
		move_towards_player()
	else:
		attack_player()
	subject.move_and_slide()


func in_same_cell_as_player() -> bool:
	var this_cell = $CellFinder.get_cell_for_position(subject.global_position)
	var player_cell = $CellFinder.get_cell_for_position(Global.PLAYER_POSITION)
	return this_cell == player_cell

