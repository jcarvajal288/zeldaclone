class_name LevelManager extends Node

@export var test_area: PackedScene
@export var grasslands: PackedScene
@export var dungeon: PackedScene
@export var dungeon2: PackedScene

var current_level

func _ready():
	Global.level_manager = self
	

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


func change_to_test_area():
	_change_level(test_area)
	Global.game_controller.move_player_to_position(Vector2(20, 20))


func change_to_grasslands(location: String = "start"):
	_change_level(grasslands)
	if location == "dungeon_entrance":
		Global.game_controller.move_player_to_position(Vector2(251, -58))
		Global.transition_level.emit("UP")
	else:
		# Global.game_controller.move_player_to_position(Vector2(231, -56))
		Global.game_controller.move_player_to_position(Vector2(80, 60))


func change_to_dungeon():
	_change_level(dungeon)
	Global.game_controller.move_player_to_position(Vector2(84, 6))
	Global.transition_level.emit("DOWN")


func change_to_dungeon_2():
	_change_level(dungeon2)
	Global.game_controller.move_player_to_position(Vector2(84, 6))
	Global.transition_level.emit("DOWN")
