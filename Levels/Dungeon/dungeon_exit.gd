extends Area2D


func _on_body_entered(player: Player) -> void:
	player.exit_up_stairs()
	await get_tree().create_timer(1.0).timeout
	Global.level_manager.change_to_grasslands("dungeon_entrance")
