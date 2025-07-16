extends Enemy

func _init():
	var spd = 30
	super(spd)

func _ready() -> void:
	on_hit.connect(_on_hit)


func _on_hit():
	$AnimationPlayer.play_damaged_animation()