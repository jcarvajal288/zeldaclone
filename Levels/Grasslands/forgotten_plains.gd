extends Level

func _ready() -> void:
	super()
	if Global.game_controller.active_bonfire == null:
		Global.game_controller.active_bonfire = $StartingRoom/Bonfire
