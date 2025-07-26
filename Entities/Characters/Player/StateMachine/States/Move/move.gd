extends State

@export var idle_state: State
@export var attack_state: State
@export var hit_state: State
@export var fall_state: State


func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("action_left"):
		return attack_state
	return null


func bind_8_way(input_direction: Vector2) -> Vector2:
	return Vector2(
		snapped(input_direction.x, 0.5),
		snapped(input_direction.y, 0.5)
	).normalized()



func process_physics(_delta: float) -> State:
	var input_direction = bind_8_way(Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down"))
	var movement = input_direction * parent.speed
	print(input_direction)
	parent.animation_player.set_facing(input_direction)
	parent.animation_player.play_with_facing(animation_name)
	if movement == Vector2.ZERO:
		return idle_state
	parent.velocity = movement
	parent.move_and_slide()
	return null