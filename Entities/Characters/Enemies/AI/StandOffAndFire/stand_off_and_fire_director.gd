extends Director


@export var ranged_attack_range_pixels: int
@export var melee_attack_range_pixels: int
@export var run_away_range: int


func _process(_delta: float) -> void:
	reset()
	if not can_see_player():
		halt()
	elif player_beyond_range(ranged_attack_range_pixels):
		move_towards_player()
	elif player_beyond_range(run_away_range):
		fire_ranged()
	elif player_beyond_range(melee_attack_range_pixels):
		move_away_from_player()
	else:
		attack_player()
	subject.move_and_slide()


func fire_ranged():
	movement_vector = subject.global_position.direction_to(Global.PLAYER_POSITION)
	ranged_attack = true


func move_away_from_player() -> void:
	var to = subject.global_position.direction_to(Global.PLAYER_POSITION)
	movement_vector = Vector2(-to.x, -to.y)
