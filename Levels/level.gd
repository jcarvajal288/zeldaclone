class_name Level extends Node2D


func _ready() -> void:
	for child in get_children():
		if is_instance_of(child, Room):
			child.absolute_position = child.position


func get_room_for_position(pos: Vector2) -> Room:
	for child in get_children():
		if is_instance_of(child, Room):
			if child.contains_position(pos):
				return child
	return null
