class_name Enemy extends Character


func _init(spd):
	super(spd)
	alignment = Global.Alignment.EVIL
	set_collision_mask_value(5, true)


func _ready():
	$AnimationPlayer.play_random_idle_animation()
	on_hit.connect(_on_hit)
	$Health.on_death.connect(_on_death)


func _on_hit(hitbox: Hitbox):
	$AnimationPlayer.play_damaged_animation()
	$Health.take_damage(hitbox.damage)

func _on_death():
	$AnimationPlayer.play_death_animation()
	velocity = Vector2.ZERO
