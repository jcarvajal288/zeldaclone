extends State

@export var idle_state: State

@export var hurtbox: Hurtbox


func enter() -> void:
	super()
	hurtbox.set_disabled(true)
	$Timer.timeout.connect(exit)
	$Timer.start()


func process_physics(_delta: float) -> State:
	if not $Timer.is_stopped():
		parent.sprite.visible = not parent.sprite.visible
	return null


func exit() -> void:
	super()
	hurtbox.set_disabled(false)