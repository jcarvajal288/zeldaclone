class_name GameController extends Node

var active_bonfire: Bonfire

func _ready():
	Global.game_controller = self
	Global.rng = RandomNumberGenerator.new()
	Global.level_manager.change_to_grasslands()
	# Global.level_manager.change_to_dungeon()
	# Global.level_manager.change_to_test_area()
	# Global.level_manager.change_to_dungeon_2()
	
func move_player_to_position(position: Vector2):
	$PlayerCharacter.position = position


func camera() -> Camera2D:
	return $Camera2D


