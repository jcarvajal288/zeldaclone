class_name Bonfire extends StaticBody2D

@onready var is_lit = true

func _ready() -> void:
	if is_lit:
		$Base.play("lit")
	else:
		$Base.play("unlit")
	$Flame.visible = is_lit
	$Glow.visible = is_lit
