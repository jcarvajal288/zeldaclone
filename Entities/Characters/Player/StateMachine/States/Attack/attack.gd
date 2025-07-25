extends State

@export var idle_state: State
@export var move_state: State
@export var hit_state: State


func process_input(_event: InputEvent) -> State:
	await parent.animation_player.animation_finished
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input_direction != Vector2.ZERO:
		return move_state
	else:
		return idle_state
