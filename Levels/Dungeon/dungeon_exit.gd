extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	Global.level_manager.change_to_grasslands("dungeon_entrance")
