extends State

@export var health: Health
@export var idle_state: State
@export var damage: int = 0

var fall_velocity = Vector2.ZERO
var old_collision_value = false

func _ready() -> void:
	Global.fell_in_pit.connect(fall_down_pit)


func fall_down_pit(character: Character, fall_vel: Vector2):
	if character == subject:
		fall_velocity = fall_vel
		print(fall_velocity)
		signal_state_change.emit(self)


func enter() -> void:
	super()
	old_collision_value = subject.get_collision_mask_value(Global.CollisionLayer.PIT_BOUNDARY)
	subject.set_collision_mask_value(Global.CollisionLayer.PIT_BOUNDARY, false)
	subject.velocity = fall_velocity
	$FallSFX.play()


func exit() -> void:
	super()
	if damage > 0:
		health.take_damage(1)
	else:
		subject.queue_free()
	subject.set_collision_mask_value(Global.CollisionLayer.PIT_BOUNDARY, old_collision_value)
	Global.fall_finished.emit(subject)


func process_physics(_delta: float) -> State:
	subject.move_and_slide()
	return null


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "fall":
		signal_state_change.emit(idle_state)
