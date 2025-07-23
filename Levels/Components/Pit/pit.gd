class_name Pit extends Area2D

signal fell_in_pit

@export var respawn_points: Array[Area2D]

func _on_body_entered(character: Character) -> void:
	print("fell into pit body")
	character.take_pit_damage()
	fell_in_pit.emit(character)
