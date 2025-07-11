class_name Enemy extends Character


func _init(spd):
	super(spd)
	alignment = Global.Alignment.EVIL
	set_collision_mask_value(5, true)


func _ready():
	$AnimationPlayer.play_random_idle_animation()
