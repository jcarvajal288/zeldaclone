extends Node

@export var subject: Character
@export var animation_player: AnimationPlayer
@export var health: Health
@export var bounce_speed: int = 50


func _on_hit(hitbox: Hitbox) -> void:
	if health.current_health > 0:
		var hitbox_position = hitbox.owning_character.position
		var bounce_direction = hitbox_position.direction_to(subject.position)
		subject.velocity = bounce_speed * bounce_direction
		var previous_pit_boundary_value = subject.get_collision_mask_value(Global.CollisionLayer.PIT_BOUNDARY)
		subject.set_collision_mask_value(Global.CollisionLayer.PIT_BOUNDARY, false)
		await animation_player.animation_finished
		subject.set_collision_mask_value(Global.CollisionLayer.PIT_BOUNDARY, previous_pit_boundary_value)
