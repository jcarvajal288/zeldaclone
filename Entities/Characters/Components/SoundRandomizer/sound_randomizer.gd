class_name SoundRandomizer extends Node

@export var sound_list: Array[AudioStreamPlayer2D]

func play():
	var i = Global.rng.randi_range(0, sound_list.size()-1)
	if sound_list != null:
		sound_list[i].play()


func _on_hit(_hitbox: Hitbox):
	play()
