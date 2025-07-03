extends Area2D


func _on_dungeon_entrance_area_entered(body):
	print("change scene")
	get_tree().change_scene_to_file("res://test_dungeon.tscn")
