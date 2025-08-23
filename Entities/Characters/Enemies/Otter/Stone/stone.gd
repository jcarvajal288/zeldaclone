class_name Stone extends RigidBody2D

@onready var stone_speed = 20


func _ready() -> void:
	linear_damp = 0.0
	gravity_scale = 0.0


func set_direction(direction: Vector2) -> void:
	apply_central_impulse(direction * stone_speed)
	rotation = direction.angle() + 90.0

