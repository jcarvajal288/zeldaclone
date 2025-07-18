class_name Pit extends Area2D

@export var respawn_points: Array[Area2D]


func _on_body_entered(_body: Node2D) -> void:
	print("fell into pit body")
