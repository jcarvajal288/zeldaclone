extends Node2D

func _ready() -> void:
	Global.level_ready.emit()
