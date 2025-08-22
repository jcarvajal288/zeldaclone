extends Director


@export var ranged_attack_range_pixels: int
@export var melee_attack_range_pixels: int
@export var run_away_range: int

var ranged_attack = false


func reset() -> void:
	super()
	ranged_attack = false


func _process(_delta: float) -> void:
	reset()
	if not can_see_player():
		# print("halting")
		halt()
	elif player_beyond_range(ranged_attack_range_pixels):
		# print("moving towards")
		move_towards_player()
	elif player_beyond_range(run_away_range):
		# print("firing")
		fire_ranged()
	elif player_beyond_range(melee_attack_range_pixels):
		# print("moving away")
		move_away_from_player()
	else:
		# print("attacking")
		attack_player()
		subject.velocity = Vector2.ZERO
	subject.move_and_slide()


func fire_ranged():
	ranged_attack = true


func move_away_from_player() -> void:
	var to = subject.global_position.direction_to(Global.PLAYER_POSITION)
	movement_vector = Vector2(-to.x, -to.y)
