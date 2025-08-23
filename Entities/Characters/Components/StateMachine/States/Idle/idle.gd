extends State

@export var move_state: State
@export var attack_state: State
@export var ranged_attack_state: State
@export var hit_state: State


func enter() -> void:
	super()
	subject.velocity = Vector2.ZERO


func process_frame(_delta: float) -> State:
	if director.movement_vector != Vector2.ZERO:
		return move_state
	if director.action_attack:
		return attack_state
	if director.ranged_attack:
		return ranged_attack_state
	return null
