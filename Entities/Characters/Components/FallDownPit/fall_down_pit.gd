extends Node

@export var subject: Character
@export var health: Health
@export var animation_player: AnimationPlayer

func _ready() -> void:
	Global.fell_in_pit.connect(fall_down_pit)
	if is_instance_of(subject, Enemy):
		subject.set_collision_layer_value(Global.CollisionLayer.PIT_BOUNDARY, true)


func fall_down_pit(character: Character, fall_velocity: Vector2):
	if subject != character:
		return
	if is_instance_of(character, Player):
		health.take_damage(1)
	animation_player.play_fall_animation()
	$FallSFX.play()
	character.velocity = fall_velocity
