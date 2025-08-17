extends State

@export var idle_state: State
@export var subject_health: Health


func _ready() -> void:
	subject_health.on_death.connect(_on_death)


func _on_death() -> void:
	signal_state_change.emit(self)


func enter() -> void:
	super()
	subject.velocity = Vector2.ZERO
	$DeathSFX.play()


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == 'death':
		if subject is Player:
			Global.game_controller.respawn_at_active_bonfire()
			signal_state_change.emit(idle_state)
		else:
			queue_free()
