class_name Stone extends RigidBody2D

@onready var stone_speed = 50


func _ready() -> void:
	linear_damp = 0.0
	gravity_scale = 0.0
	contact_monitor = true
	max_contacts_reported = 1
	body_entered.connect(on_body_entered)


func set_direction(direction: Vector2) -> void:
	apply_central_impulse(direction * stone_speed)
	rotation = direction.angle() + PI / 2


func on_body_entered(_body: Node2D) -> void:
	queue_free()