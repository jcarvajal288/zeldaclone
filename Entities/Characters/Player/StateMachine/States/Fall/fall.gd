extends State

@export var health: Health
@export var idle_state: State
@export var damage: int = 0

var fall_velocity = Vector2.ZERO


func enter() -> void:
	parent.animation_player.play_fall_animation()
	parent.velocity = fall_velocity
	$FallSFX.play()


func physics_process(_delta: float) -> State:
	await parent.animation_player.animation_finished
	if damage > 0:
		health.take_damage(1)
		return idle_state
	else:
		parent.queue_free()
		return null