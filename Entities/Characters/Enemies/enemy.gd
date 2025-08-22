class_name Enemy extends Character


func _init(spd):
	super(spd)
	alignment = Global.Alignment.EVIL
	set_collision_mask_value(Global.CollisionLayer.ENEMY_BOUNDARY, true)
	set_collision_mask_value(Global.CollisionLayer.PIT_BOUNDARY, true)

