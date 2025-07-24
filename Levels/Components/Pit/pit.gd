class_name Pit extends Area2D

@export var room: Room

func _on_body_entered(character: Character) -> void:
	var fall_direction = ($PitCollisionShape.position - character.position).normalized()
	var distance_to_center = character.position.distance_to($PitCollisionShape.position)
	Global.fell_in_pit.emit(character, fall_direction * distance_to_center)
	Global.fall_finished.connect(_on_fall_animation_finished)


func _on_fall_animation_finished(character: Character):
	if is_instance_of(character, Enemy):
		character.queue_free()
	elif room.contains_position(character.position): 
		room.teleport_to_last_used_entrance(character)
