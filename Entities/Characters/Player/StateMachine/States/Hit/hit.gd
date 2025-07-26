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
		subject.sprite.visible = not subject.sprite.visible
	return null


func exit() -> void:
	super()
	hurtbox.set_disabled(false)