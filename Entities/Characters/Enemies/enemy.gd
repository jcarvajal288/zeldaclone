class_name Enemy extends Character


func _init(spd):
	super(spd)
	alignment = Global.Alignment.EVIL
	set_collision_mask_value(Global.CollisionLayer.ENEMY_BOUNDARY, true)
	set_collision_mask_value(Global.CollisionLayer.PIT_BOUNDARY, true)


func _ready():
	animation_player.play_random_idle_animation()
	$Health.on_death.connect(_on_death)


func _on_hit(hitbox: Hitbox):
	animation_player.play_damaged_animation()
	$Health.take_damage(hitbox.damage)

func _on_death():
	animation_player.play_death_animation()
	velocity = Vector2.ZERO
