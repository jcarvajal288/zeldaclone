class_name Effect extends AnimatedSprite2D

func _ready() -> void:
	z_index = Global.RenderOrder.EFFECT
	animation_finished.connect(_on_animation_finished)


func _on_animation_finished() -> void:
	queue_free()