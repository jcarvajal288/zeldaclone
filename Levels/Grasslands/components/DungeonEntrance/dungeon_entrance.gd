extends Area2D


func _on_dungeon_entrance_area_entered(player: Node2D):
	if player is Player:
		Global.stairs_used.emit(
			Global.StairsDirection.EXIT_DOWN,  
			Global.level_manager.dungeon2, 
			"dungeon_exit"
		)


