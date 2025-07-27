class_name Director extends Node

var movement_vector = Vector2.ZERO
var action_attack = false

func reset() -> void:
	movement_vector = Vector2.ZERO
	action_attack = false