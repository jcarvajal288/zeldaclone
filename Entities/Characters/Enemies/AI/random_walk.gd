extends Node

@export var subject: CharacterBody2D
@export var animation_player: AnimationPlayer

func _ready():
	change_direction()
	
func _process(delta: float) -> void:
	if subject.velocity == Vector2.ZERO and not animation_player.current_animation.contains("idle"):
		animation_player.play_random_idle_animation()
	elif subject.velocity != Vector2.ZERO:
		animation_player.play_move_animation()
	subject.move_and_slide()
	
func _on_walk_timer_timeout() -> void:
	if not animation_player.animation_locked:
		change_direction()
	
func change_direction():
	var random_x = Global.rng.randf_range(-1, 1)
	var random_y = Global.rng.randf_range(-1, 1)
	var random_direction = Vector2(random_x, random_y).normalized()
	subject.velocity = subject.speed * random_direction
	$WalkTimer.start()
