class_name Pit extends Area2D


func _on_body_entered(character: Character) -> void:
	character.take_pit_damage()
	var fall_direction = ($PitCollisionShape.position - character.position).normalized()
	character.fall_down_pit(fall_direction)
