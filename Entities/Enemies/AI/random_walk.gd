extends Node

@export var subject: CharacterBody2D

func _ready():
	change_direction()
	
func _process(delta: float) -> void:
	subject.move_and_slide()
	
func _on_walk_timer_timeout() -> void:
	change_direction()
	
func change_direction():
	var random_x = Global.rng.randf_range(-1, 1)
	var random_y = Global.rng.randf_range(-1, 1)
	var random_direction = Vector2(random_x, random_y)
	subject.velocity = subject.speed * random_direction
	print(subject.velocity)
	$WalkTimer.start()
