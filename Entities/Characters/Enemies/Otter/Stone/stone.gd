class_name Stone extends RigidBody2D

@onready var stone_speed = 50
@onready var stone_impact_scene = preload("res://Entities/Characters/Enemies/Otter/Stone/stone_impact.tscn")

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
	var impact = stone_impact_scene.instantiate()
	impact.global_position = global_position
	get_tree().root.add_child(impact)
	queue_free()