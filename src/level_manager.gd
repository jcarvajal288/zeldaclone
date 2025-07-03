class_name LevelManager extends Node

@export var grasslands: PackedScene
@export var dungeon: PackedScene

var current_level

func _ready():
	Global.level_manager = self
	#_change_level(grasslands)
	_change_level(dungeon)
	
func _change_level(packed_new_level: PackedScene, delete: bool = true, keep_running: bool = false):
	if current_level != null:
		if delete:
			current_level.queue_free() # removes node entirely
		elif keep_running:
			current_level.visible = false # keeps in memory and running
		else:
			self.remove_child(current_level) # keeps in memory, does not run
	var new_level = packed_new_level.instantiate()
	self.add_child(new_level)
	current_level = new_level

func change_to_dungeon():
	_change_level(dungeon)
	Global.game_controller.move_player_to_position(Vector2(80, 20))

func change_to_grasslands():
	_change_level(grasslands)
	Global.game_controller.move_player_to_position(Vector2(231, -56))
