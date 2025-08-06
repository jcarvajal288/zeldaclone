extends State

@export var idle_state: State
@export var hurtbox: Hurtbox
@export var sprite: Sprite2D
@export var bounce_speed: int = 50
@export var timer_length: float = 0.25

var previous_pit_boundary_value


@onready var hit_origin = Vector2.ZERO

func _ready() -> void:
	hurtbox.on_hit.connect(_on_hit)


func _on_hit(area: Area2D) -> void:
	hit_origin = area.global_position
	signal_state_change.emit(self)


func enter() -> void:
	print("enter")
	super()
	hurtbox.set_disabled(true)
	start_bounce()
	$Timer.start(timer_length)
	$OnHitSFX.play()


func process_physics(delta: float) -> State:
	subject.move_and_slide()
	if $Timer.time_left - delta <= 0:
		return idle_state
	else:
		sprite.visible = not sprite.visible
	return null


func exit() -> void:
	super()
	hurtbox.set_disabled(false)
	sprite.visible = true
	end_bounce()


func start_bounce() -> void:
	if subject.health.current_health > 0:
		var bounce_direction = hit_origin.direction_to(subject.position)
		subject.velocity = bounce_speed * bounce_direction
		previous_pit_boundary_value = subject.get_collision_mask_value(Global.CollisionLayer.PIT_BOUNDARY)
		subject.set_collision_mask_value(Global.CollisionLayer.PIT_BOUNDARY, false)


func end_bounce() -> void:
	subject.velocity = Vector2.ZERO
	subject.set_collision_mask_value(Global.CollisionLayer.PIT_BOUNDARY, previous_pit_boundary_value)
