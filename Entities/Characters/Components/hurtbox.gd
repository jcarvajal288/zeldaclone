extends Area2D

@export var owning_character: Character
@export var health: Health 


func _ready():
	area_entered.connect(_on_area_entered)


func deal_damage(damage: int):
	if health != null:
		health.take_damage(damage)


func _on_area_entered(hitbox: Hitbox) -> void:
	if hitbox.alignment == owning_character.alignment:
		return
	deal_damage(hitbox.damage)
	if health.not_dead():
		owning_character._impact_bounce(hitbox)
		owning_character.play_animation("damaged" + owning_character.facing, true)
	else:
		owning_character.play_animation("death", true)
		owning_character.velocity = Vector2.ZERO
		
