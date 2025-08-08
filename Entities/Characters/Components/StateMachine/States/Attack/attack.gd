extends State

@export var idle_state: State
@export var move_state: State

var is_finished = false


func _on_animation_finished(_anim_name: StringName) -> void:
	is_finished = true


func enter() -> void:
	super()
	subject.animation_player.animation_finished.connect(_on_animation_finished)
	$AttackSoundRandomizer.play()
	is_finished = false


func process_input(_event: InputEvent) -> State:
	if not is_finished:
		return null
	if director.movement_vector != Vector2.ZERO:
		return move_state
	else:
		return idle_state
