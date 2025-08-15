extends State

@export var idle_state: State

var direction: Global.StairsDirection = Global.StairsDirection.EXIT_DOWN
var next_scene: PackedScene
var next_location: String


func _ready() -> void:
	Global.stairs_used.connect(_on_stairs_used)


func _on_stairs_used(sent_direction: Global.StairsDirection, sent_scene: PackedScene, sent_location: String) -> void:
	direction = sent_direction
	next_scene = sent_scene
	next_location = sent_location
	signal_state_change.emit(self)


func enter() -> void:
	match direction:
		Global.StairsDirection.EXIT_UP:
			exit_up()
		Global.StairsDirection.EXIT_DOWN:
			exit_down()

func exit() -> void:
	subject.z_index = Global.RenderOrder.PLAYER
	set_entryway_trigger(true)


func set_entryway_trigger(trigger: bool) -> void:
	subject.set_collision_layer_value(Global.CollisionLayer.PLAYER, trigger) 


func exit_up() -> void:
	set_entryway_trigger(false)
	subject.z_index = Global.RenderOrder.FLOOR + 1
	subject.velocity = Vector2.UP * 5
	await await_and_signal_level_change()
	enter_from_down()


func exit_down() -> void:
	set_entryway_trigger(false)
	subject.z_index = Global.RenderOrder.BASE + 1
	subject.animation_player.set_facing(Vector2.UP)
	subject.velocity = Vector2.DOWN * 5
	await await_and_signal_level_change()
	enter_from_up()


func enter_from_down() -> void:
	subject.z_index = Global.RenderOrder.BASE + 1
	subject.animation_player.set_facing(Vector2.DOWN)
	subject.animation_player.play_with_facing(self.animation_name)
	subject.velocity = Vector2.UP * 10
	await get_tree().create_timer(1.0).timeout
	# step down to avoid the exit trigger
	subject.z_index = Global.RenderOrder.PLAYER
	subject.velocity = Vector2.DOWN * 10
	await get_tree().create_timer(0.2).timeout
	signal_state_change.emit(idle_state)


func enter_from_up() -> void:
	subject.animation_player.set_facing(Vector2.DOWN)
	subject.animation_player.play_with_facing(self.animation_name)
	subject.z_index = Global.RenderOrder.FLOOR + 1
	subject.velocity = Vector2.DOWN * 10
	await get_tree().create_timer(1.0).timeout
	signal_state_change.emit(idle_state)


func await_and_signal_level_change() -> void:
	await get_tree().create_timer(1.0).timeout
	Global.transition_level.emit(next_scene, next_location)


func process_physics(_delta: float) -> State:
	subject.move_and_slide()
	return null
