class_name Pit extends Area2D

@export var respawn_points: Array[Area2D]

func _on_body_entered(character: Character) -> void:
	print("fell into pit body")
	character.take_pit_damage()
	var center_point = $PitCollisionShape.shape.get_rect().get_center()
	character.fall_down_pit(center_point)
