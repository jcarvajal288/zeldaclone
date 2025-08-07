extends State

@export var subject_health: Health
@export var animation_player: AnimationPlayer


func _ready() -> void:
	subject_health.on_death.connect(_on_death)
	animation_player.animation_finished.connect(_on_animation_finished)


func _on_death() -> void:
	signal_state_change.emit(self)


func enter() -> void:
	subject.velocity = Vector2.ZERO


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == 'death':
		queue_free()
