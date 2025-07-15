extends Area2D


func _on_dungeon_entrance_area_entered(player: Player):
	player.exit_down_stairs()	
	await get_tree().create_timer(1.0).timeout
	Global.level_manager.change_to_dungeon()


