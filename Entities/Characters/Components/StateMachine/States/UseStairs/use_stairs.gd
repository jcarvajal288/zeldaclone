extends State

@export var idle_state: State

var direction: Global.StairsDirection = Global.StairsDirection.EXIT_DOWN


func _ready() -> void:
	Global.stairs_used.connect(_on_stairs_used)


func _on_stairs_used(sent_direction: Global.StairsDirection) -> void:
	direction = sent_direction
	signal_state_change.emit(self)


func enter() -> void:
	match direction:
		Global.StairsDirection.ENTER_UP:
			enter_up()
		Global.StairsDirection.ENTER_DOWN:
			enter_down()
		Global.StairsDirection.EXIT_UP:
			exit_up()
		Global.StairsDirection.EXIT_DOWN:
			exit_down()


func enter_up() -> void:
	subject.animation_player.set_facing(Vector2.DOWN)
	subject.velocity = Vector2.UP * 10

func enter_down() -> void:
	subject.z_index = Global.RenderOrder.PLAYER
	subject.velocity = Vector2.DOWN * 5
	await get_tree().create_timer(0.5).timeout
	subject.set_collision_layer_value(2, true) # re-enable triggers


func exit_up() -> void:
	subject.set_collision_layer_value(2, false) # disable entryway trigger
	subject.velocity = Vector2.UP * 5


func exit_down() -> void:
	subject.z_index = Global.RenderOrder.BASE + 1
	subject.animation_player.set_facing(Vector2.UP)
	subject.velocity = Vector2.UP * 10
	await get_tree().create_timer(1.0).timeout
	Global.level_manager.transition_level.emit()


func process_physics(_delta: float) -> State:
	subject.move_and_slide()
	return null
