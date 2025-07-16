extends Area2D

@export var owning_character: CharacterBody2D
@export var animation_player: AnimationPlayer
@export var health: Health 


func _ready():
	area_entered.connect(_on_area_entered)


func _on_area_entered(hitbox: Hitbox) -> void:
	if owning_character == null:
		return
	if hitbox.owning_character.alignment == owning_character.alignment:
		return
	_impact_bounce(hitbox)
	owning_character.on_hit.emit(hitbox)
		

func _impact_bounce(hitbox: Hitbox):
	var hitbox_position = hitbox.owning_character.position
	var bounce_direction = hitbox_position.direction_to(owning_character.position)
	owning_character.velocity = 50 * bounce_direction
