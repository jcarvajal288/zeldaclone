extends Area2D

func _on_dungeon_entrance_area_entered(_body):
	Global.level_manager.change_to_dungeon()
