extends State

@export var idle_state: State


func physics_process(_delta: float) -> State:
	await parent.animation_player.animation_finished
	return idle_state