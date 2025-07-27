extends State

@export var state_machine: StateMachine
@export var health: Health
@export var idle_state: State
@export var damage: int = 0

var fall_velocity = Vector2.ZERO

func _ready() -> void:
	Global.fell_in_pit.connect(fall_down_pit)


func fall_down_pit(_character: Character, fall_vel: Vector2):
	fall_velocity = fall_vel
	state_machine.change_state(self)



func enter() -> void:
	subject.animation_player.play_fall_animation()
	subject.velocity = fall_velocity
	$FallSFX.play()


func process_physics(_delta: float) -> State:
	if subject.animation_player.current_animation == "fall":
		subject.move_and_slide()
		return null
	elif damage > 0:
		health.take_damage(1)
		return idle_state
	else:
		subject.queue_free()
		return null
