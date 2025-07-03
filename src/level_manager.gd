class_name LevelManager extends Node

var current_level

func _ready():
	Global.level_manager = self
	change_level("res://test_grassland.tscn")
	
func change_level(new_level_name: String, delete: bool = true, keep_running: bool = false):
	if current_level != null:
		if delete:
			current_level.queue_free() # removes node entirely
		elif keep_running:
			current_level.visible = false # keeps in memory and running
		else:
			self.remove_child(current_level) # keeps in memory, does not run
	var new_level = load(new_level_name).instantiate()
	self.add_child(new_level)
	current_level = new_level
