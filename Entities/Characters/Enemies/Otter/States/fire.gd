extends State

@export var idle_state: State
@export var projectile_scene: PackedScene

var is_finished = false


func _on_animation_finished(_anim_name: StringName) -> void:
	is_finished = true


func enter() -> void:
	super()
	if not subject.animation_player.animation_finished.is_connected(Callable(self, "_on_animation_finished")):
		subject.animation_player.animation_finished.connect(_on_animation_finished)
	is_finished = false
	subject.velocity = Vector2.ZERO


func process_frame(_delta: float) -> State:
	if not is_finished:
		return null
	else:
		fire_projectile()
		return idle_state


func fire_projectile() -> void:
	var projectile = projectile_scene.instantiate()
	get_tree().root.add_child(projectile)
	projectile.global_position = subject.global_position
	projectile.set_direction(director.movement_vector)