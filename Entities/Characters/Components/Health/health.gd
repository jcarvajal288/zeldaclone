class_name Health extends Node

@export var max_health: int
@export var is_player_health: bool
var current_health = max_health

signal died_signal

func _ready():
	current_health = max_health
	if is_player_health:
		Global.player_health_changed.emit(current_health)
	
func take_damage(damage: int):
	current_health -= damage
	if is_player_health:
		Global.player_health_changed.emit(current_health)
	if current_health <= 0:
		died_signal.emit()
		
func not_dead() -> bool:
	return current_health > 0
