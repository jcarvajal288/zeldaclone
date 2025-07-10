class_name Health extends Node

@export var max_health = 1
var current_health = max_health

signal died_signal

func _ready():
	current_health = max_health
	
func take_damage(damage: int):
	current_health -= damage
	if current_health <= 0:
		died_signal.emit()
		
func not_dead() -> bool:
	return current_health > 0
