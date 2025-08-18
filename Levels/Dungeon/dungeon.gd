class_name Dungeon extends Level


func _ready() -> void:
	super()
	if Global.bonfire_registry == null:
		Global.bonfire_registry = BonfireRegistry.new()
	var this_packed_scene = PackedScene.new()
	this_packed_scene.pack(self)
	Global.bonfire_registry.register_bonfire(
		"Dungeon East Room",
		$EastRoom/Bonfire/SpawnPoint.global_position,
		this_packed_scene,
	)