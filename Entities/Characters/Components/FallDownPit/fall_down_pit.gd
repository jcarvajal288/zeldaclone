extends Node

@export var subject: Character
@export var state_machine: StateMachine
@export var fall_state: State
@export var allow_walking_into_pits: bool

func _ready() -> void:
	Global.fell_in_pit.connect(fall_down_pit)
	if not allow_walking_into_pits:
		subject.set_collision_mask_value(Global.CollisionLayer.PIT_BOUNDARY, true)


func fall_down_pit(_character: Character, fall_velocity: Vector2):
	fall_state.fall_velocity = fall_velocity
	state_machine.change_state(fall_state)
