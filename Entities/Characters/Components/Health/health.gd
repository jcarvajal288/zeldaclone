class_name Health extends Node

@export var max_health: int
@export var is_player_health: bool
var current_health = max_health

signal on_death


func _ready():
	current_health = max_health
	if is_player_health:
		Global.player_health_changed.emit(current_health, max_health)


func reset() -> void:
	current_health = max_health
	Global.player_health_changed.emit(current_health, max_health)


func _on_hit(hitbox: Area2D):
	if not hitbox is Hitbox:
		return
	else:
		take_damage(hitbox.damage)

	
func take_damage(damage: int):
	if current_health <= 0:
		return
	current_health -= damage
	if is_player_health:
		Global.player_health_changed.emit(current_health, max_health)
	if current_health <= 0:
		on_death.emit()

		
func is_dead() -> bool:
	return current_health <= 0
