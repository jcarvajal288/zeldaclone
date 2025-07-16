class_name Player extends Character

@export var inventory: Inventory

signal moved_to_new_map_cell(cell)

@onready var animation_player = $AnimationPlayer
@onready var sword_swing_sfx = $SwordSwingSoundRandomizer

var current_map_cell = Vector2i.ZERO

func _init():
	var spd = 50
	super(spd)
	alignment = Global.Alignment.GOOD


func _ready() -> void:
	Global.transition_level.connect(enter_level)

		
func _set_camera_position():
	var new_map_cell = $CellFinder.get_cell_for_position(self.position)
	if new_map_cell != current_map_cell:
		moved_to_new_map_cell.emit(new_map_cell)
		current_map_cell = new_map_cell
		
	
func _physics_process(_delta):
	if not $AnimationPlayer.animation_locked:
		$InputController.get_input()
	_set_camera_position()
	move_and_slide()
	Global.PLAYER_POSITION = self.position

func exit_down_stairs():
	$AnimationPlayer.animation_locked = true
	self.set_collision_layer_value(2, false) # disable entryway trigger
	self.z_index = Global.RenderOrder.BASE + 1
	self.velocity = Vector2.DOWN * 5


func enter_level(direction: String):
	if direction == "UP":
		enter_up_stairs()
	else:
		enter_down_stairs()


func enter_down_stairs():
	self.z_index = Global.RenderOrder.PLAYER
	$AnimationPlayer.set_facing(Vector2.DOWN)
	self.velocity = Vector2.DOWN * 10
	$AnimationPlayer.play_move_animation()
	await get_tree().create_timer(1.0).timeout
	$AnimationPlayer.animation_locked = false
	self.set_collision_layer_value(2, true) # re-enable triggers


func exit_up_stairs():
	$AnimationPlayer.animation_locked = true
	self.set_collision_layer_value(2, false) # disable entryway trigger
	self.velocity = Vector2.UP * 5


func enter_up_stairs():
	$AnimationPlayer.animation_locked = true
	self.z_index = Global.RenderOrder.BASE + 1
	$AnimationPlayer.set_facing(Vector2.DOWN)
	$AnimationPlayer.play_move_animation()
	self.velocity = Vector2.UP * 10
	await get_tree().create_timer(1.0).timeout
	self.z_index = Global.RenderOrder.PLAYER
	self.velocity = Vector2.DOWN * 5
	await get_tree().create_timer(0.5).timeout
	self.set_collision_layer_value(2, true) # re-enable triggers
	$AnimationPlayer.animation_locked = false
