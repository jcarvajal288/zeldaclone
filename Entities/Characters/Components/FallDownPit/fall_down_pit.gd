extends Node

@export var subject: Character
@export var health: Health
@export var animation_player: AnimationPlayer

func _ready() -> void:
	Global.fell_in_pit.connect(fall_down_pit)


func fall_down_pit(character: Character, fall_direction: Vector2):
	if subject != character:
		return
	health.take_damage(1)
	animation_player.play_fall_animation()
	character.velocity = fall_direction * 20
