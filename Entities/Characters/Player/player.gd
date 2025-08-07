class_name Player extends Character

@export var inventory: Inventory

signal move_camera(position)

@onready var sword_swing_sfx = $SwordSwingSoundRandomizer


var current_map_cell = Vector2i.ZERO

func _init():
	var spd = 50
	super(spd)
	alignment = Global.Alignment.GOOD


func _ready() -> void:
	$StateMachine.init(self)

		
func set_camera_position():
	move_camera.emit(self.position)

func _unhandled_input(event: InputEvent) -> void:
	$StateMachine.process_input(event)
		
	
func _physics_process(delta):
	Global.PLAYER_POSITION = self.position
	$StateMachine.process_physics(delta)
	set_camera_position()


func _process(delta: float) -> void:
	$StateMachine.process_frame(delta)


func _on_death():
	animation_player.play_death_animation()
	velocity = Vector2.ZERO
