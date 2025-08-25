extends State

@export var idle_state: State
@export var projectile_scene: PackedScene
@export var projectile_spawn_x: float
@export var projectile_spawn_y: float

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
	projectile.global_position = subject.global_position + get_projectile_spawn_location()
	projectile.set_direction(director.movement_vector)
	projectile.set_hitbox_owner(subject)


func get_projectile_spawn_location() -> Vector2:
	var direction = Global.convert_to_8_way(director.movement_vector)
	match direction:
		"Up":
			return Vector2(0, -projectile_spawn_y)
		"UpRight":
			return Vector2(projectile_spawn_x, -projectile_spawn_y)
		"Right":
			return Vector2(projectile_spawn_x, 0)
		"DownRight":
			return Vector2(projectile_spawn_x, projectile_spawn_y)
		"Down":
			return Vector2(0, projectile_spawn_y)
		"DownLeft":
			return Vector2(-projectile_spawn_x, projectile_spawn_y)
		"Left":
			return Vector2(-projectile_spawn_x, 0)
		_:
			return Vector2(-projectile_spawn_x, -projectile_spawn_y)
