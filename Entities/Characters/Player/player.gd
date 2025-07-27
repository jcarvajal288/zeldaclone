class_name Player extends Character

@export var inventory: Inventory

signal move_camera(position)

@onready var animation_player = $AnimationPlayer
@onready var sword_swing_sfx = $SwordSwingSoundRandomizer
@onready var get_hit_sfx = $GetHitSoundPlayer


var current_map_cell = Vector2i.ZERO

func _init():
	var spd = 50
	super(spd)
	alignment = Global.Alignment.GOOD


func _ready() -> void:
	# $Health.on_death.connect(_on_death)
	# Global.transition_level.connect(enter_level)
	$StateMachine.init(self)

		
func set_camera_position():
	move_camera.emit(self.position)

func _unhandled_input(event: InputEvent) -> void:
	$StateMachine.process_input(event)
		
	
func _physics_process(delta):
	# if not $AnimationPlayer.animation_locked:
	# 	$InputDirector.get_input()
	# set_camera_position()
	# move_and_slide()
	# Global.PLAYER_POSITION = self.position
	$StateMachine.process_physics(delta)
	set_camera_position()


func _process(delta: float) -> void:
	$StateMachine.process_frame(delta)


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


func _on_hit(hitbox: Hitbox):
	animation_player.play_damaged_animation()
	get_hit_sfx.play()
	$Health.take_damage(hitbox.damage)


func _on_death():
	animation_player.play_death_animation()
	velocity = Vector2.ZERO

