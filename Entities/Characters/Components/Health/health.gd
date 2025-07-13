class_name Health extends Node

@export var max_health: int
var current_health = max_health

signal died_signal

func _ready():
	current_health = max_health
	Global.health_changed.emit(current_health)
	
func take_damage(damage: int):
	current_health -= damage
	print("health changed")
	Global.health_changed.emit(current_health)
	if current_health <= 0:
		died_signal.emit()
		
func not_dead() -> bool:
	return current_health > 0
