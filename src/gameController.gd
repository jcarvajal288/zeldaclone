class_name GameController extends Node

func _ready():
	Global.game_controller = self
	
func move_player_to_position(position: Vector2):
	$PlayerCharacter.position = position
