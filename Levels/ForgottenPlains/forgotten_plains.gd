extends Level

func _ready() -> void:
	super()
	if Global.bonfire_registry == null:
		Global.bonfire_registry = BonfireRegistry.new()
	var this_packed_scene = PackedScene.new()
	this_packed_scene.pack(self)
	Global.bonfire_registry.register_bonfire(
		$StartingRoom/Bonfire.bonfire_name,
		$StartingRoom/Bonfire/SpawnPoint.global_position,
		this_packed_scene,
	)
	Global.bonfire_registry.active_bonfire = Global.bonfire_registry.registry.size() - 1
