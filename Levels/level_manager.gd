class_name LevelManager extends Node

@export var test_area: PackedScene
@export var grasslands: PackedScene
@export var dungeon: PackedScene
@export var dungeon2: PackedScene

var grasslands_dungeon_entrance = Vector2(332, -316)

var current_level: Level


func _ready():
	Global.level_manager = self
	Global.transition_level.connect(transition_to_scene)
	

func change_level(packed_new_level: PackedScene, delete: bool = true, keep_running: bool = false):
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
	change_level(test_area)
	Global.game_controller.move_player_to_position(Vector2(20, 20))


func change_to_grasslands(location: String = "start"):
	change_level(grasslands)
	if location == "dungeon_entrance":
		Global.game_controller.move_player_to_position(grasslands_dungeon_entrance)
		Global.transition_level.emit("UP")
		transition_to_position(grasslands_dungeon_entrance)
	else:
		var entry_position = Global.game_controller.active_bonfire.get_spawn_point()
		Global.game_controller.move_player_to_position(entry_position)
		transition_to_position(entry_position)


func change_to_dungeon():
	change_level(dungeon)
	var entry_position = Vector2(84, 6)
	Global.game_controller.move_player_to_position(entry_position)
	# Global.transition_level.emit("DOWN")
	transition_to_position(entry_position)


func change_to_dungeon_2():
	change_level(dungeon2)
	# var entry_position = Vector2(84, 6)
	var entry_position = Vector2(20, 20)
	Global.game_controller.move_player_to_position(entry_position)
	# Global.transition_level.emit("DOWN")
	transition_to_position(entry_position)


func transition_to_position(new_position: Vector2):
	Global.game_controller.move_player_to_position(new_position)
	var entry_room = get_room_for_position(new_position)
	Global.game_controller.camera().bind_to_room(entry_room)



func get_room_for_position(position: Vector2) -> Room:
	return current_level.get_room_for_position(position)


func transition_to_scene(scene: PackedScene, location: String) -> void:
	change_level(scene)
	var entry_position = get_entry_position(scene, location)
	transition_to_position(entry_position)


func get_entry_position(scene: PackedScene, location: String) -> Vector2:
	if scene == grasslands:
		if location == "dungeon_entrance":
			# return Vector2(251, -58)
			return Vector2(332, -316)
	elif scene == dungeon2:
		return Vector2(84, 6)
	push_error("Invalid scene/location combination: [invalid scene], %s" % location)
	return Vector2.ZERO
