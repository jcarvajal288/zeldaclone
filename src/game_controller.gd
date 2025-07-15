class_name GameController extends Node

func _ready():
	Global.game_controller = self
	Global.rng = RandomNumberGenerator.new()
	Global.level_manager.change_to_grasslands()
	#Global.level_manager.change_to_test_area()
	
func move_player_to_position(position: Vector2):
	$PlayerCharacter.position = position
