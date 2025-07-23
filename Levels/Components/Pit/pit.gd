class_name Pit extends Area2D

@export var room: Room

func _on_body_entered(character: Character) -> void:
	var fall_direction = ($PitCollisionShape.position - character.position).normalized()
	Global.fell_in_pit.emit(character, fall_direction)
	Global.fall_finished.connect(_on_fall_animation_finished)


func _on_fall_animation_finished(character: Character):
	if room.contains_position(character.position): 
		room.teleport_to_last_used_entrance(character)
