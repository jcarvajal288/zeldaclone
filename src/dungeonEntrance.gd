extends Area2D

func _on_dungeon_entrance_area_entered(body):
	Global.level_manager.change_level("res://test_dungeon.tscn")
	Global.game_controller.move_player_to_position(Vector2(84, 24))
