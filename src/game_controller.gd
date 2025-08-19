class_name GameController extends Node

func _ready():
	Global.game_controller = self
	Global.rng = RandomNumberGenerator.new()
	Global.level_manager.change_to_grasslands()
	# Global.level_manager.change_to_dungeon()
	# Global.level_manager.change_to_test_area()
	# Global.level_manager.change_to_dungeon_2()
	
func move_player_to_position(position: Vector2):
	$PlayerCharacter.global_position = position


func respawn_at_active_bonfire() -> void:
	var active_bonfire = Global.bonfire_registry.get_active_bonfire()
	$PlayerCharacter.global_position = active_bonfire.spawn_point
	Global.level_manager.change_level(active_bonfire.host_level)
	Global.level_manager.transition_to_position($PlayerCharacter.global_position)
	$PlayerCharacter/Health.reset()


func camera() -> Camera2D:
	return $Camera2D
