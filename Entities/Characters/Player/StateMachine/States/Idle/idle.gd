extends State

@export var move_state: State
@export var attack_state: State
@export var hit_state: State
@export var death: State


func enter() -> void:
	super()
	parent.velocity = Vector2.ZERO


func process_input(_event: InputEvent) -> State:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input_direction != Vector2.ZERO:
		return move_state
	if Input.is_action_just_pressed("action_left"):
		return attack_state
	return null
