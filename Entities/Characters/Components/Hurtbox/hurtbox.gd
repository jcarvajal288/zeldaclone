extends Area2D

@export var owning_character: Character
@export var animation_player: AnimationPlayer
@export var health: Health 


func _ready():
	area_entered.connect(_on_area_entered)


func deal_damage(damage: int):
	if health != null:
		health.take_damage(damage)


func _on_area_entered(hitbox: Hitbox) -> void:
	if owning_character == null:
		return
	if hitbox.owning_character.alignment == owning_character.alignment:
		return
	deal_damage(hitbox.damage)
	if health.not_dead():
		_impact_bounce(hitbox)
		animation_player.play_damaged_animation()
	else:
		animation_player.play_death_animation()
		owning_character.velocity = Vector2.ZERO
		

func _impact_bounce(hitbox: Hitbox):
	var hitbox_position = hitbox.owning_character.position
	var bounce_direction = hitbox_position.direction_to(owning_character.position)
	owning_character.velocity = 50 * bounce_direction
