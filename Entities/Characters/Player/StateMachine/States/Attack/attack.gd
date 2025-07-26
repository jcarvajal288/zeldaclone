extends State

@export var idle_state: State
@export var move_state: State
@export var hit_state: State

var is_finished = false


func _on_animation_finished(_anim_name: StringName) -> void:
	is_finished = true


func enter() -> void:
	var input_direction = Global.game_controller.bind_8_way(Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down"))
	parent.animation_player.play_attack_animation_with_input(input_direction)
	parent.animation_player.animation_finished.connect(_on_animation_finished)
	is_finished = false


func process_input(_event: InputEvent) -> State:
	if not is_finished:
		return null
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input_direction != Vector2.ZERO:
		return move_state
	else:
		return idle_state
