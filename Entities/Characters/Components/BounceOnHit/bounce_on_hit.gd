extends Node

@export var owning_character: Character
@export var health: Health
@export var bounce_speed: int = 50


func _on_hit(hitbox: Hitbox) -> void:
	if health.current_health > 0:
		var hitbox_position = hitbox.owning_character.position
		var bounce_direction = hitbox_position.direction_to(owning_character.position)
		owning_character.velocity = bounce_speed * bounce_direction
