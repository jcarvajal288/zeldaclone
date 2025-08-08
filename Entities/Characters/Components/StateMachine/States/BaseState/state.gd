class_name State extends Node

enum AnimationType {
	REGULAR,
	FACING,
	EIGHT_WAY,
}

@export var animation_name: String
@export var animation_type: AnimationType


var director: Director
var subject: Character
var signal_state_change

func enter() -> void:
	subject.animation_player.play("RESET")
	subject.animation_player.advance(0)
	if animation_type == AnimationType.FACING:
		subject.animation_player.play_with_facing(animation_name)
	elif animation_type == AnimationType.EIGHT_WAY:
		subject.animation_player.play_animation_with_input(animation_name, director.movement_vector)
	else:
		subject.animation_player.play(animation_name)


func exit() -> void:
	pass


func process_input(_event: InputEvent) -> State:
	return null


func process_physics(_delta: float) -> State:
	return null


func process_frame(_delta: float) -> State:
	return null
