extends Node

@export var sprite: Sprite2D
@export var hurtbox: Hurtbox
@export var animation_player: AnimationPlayer
@export var timeout: float = 0.5


func _ready() -> void:
	hurtbox.on_hit.connect(start_invulnerability)
	$Timer.timeout.connect(end_invulnerability)


func start_invulnerability(_hitbox: Hitbox):
	hurtbox.set_disabled(true)
	$Timer.start(timeout)


func _physics_process(_delta: float) -> void:
	if not $Timer.is_stopped():
		sprite.visible = not sprite.visible


func end_invulnerability():
	if animation_player.current_animation != "fall":
		hurtbox.set_disabled(false)
	sprite.visible = true
