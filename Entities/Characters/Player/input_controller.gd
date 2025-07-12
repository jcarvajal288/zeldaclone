extends Node

@export var owning_character: Character
@export var animation_player: AnimationPlayer

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var is_attacking = Input.is_action_just_pressed("action_left")
	if is_attacking:
		owning_character.velocity = Vector2.ZERO
		animation_player.play_attack_animation_with_input(input_direction)
		return
		
	if input_direction != Vector2.ZERO:
		owning_character.velocity = input_direction * owning_character.speed
		animation_player.set_facing(input_direction)
		animation_player.play_move_animation()
	else:
		owning_character.velocity = Vector2.ZERO
		animation_player.play_idle_animation()
