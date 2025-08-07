extends Area2D


func _on_body_entered(_player: Player) -> void:
	Global.stairs_used.emit(
		Global.StairsDirection.EXIT_UP,  
		Global.level_manager.grasslands, 
		"dungeon_entrance"
	)
