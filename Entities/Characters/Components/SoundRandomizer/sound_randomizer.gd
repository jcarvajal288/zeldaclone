extends Node

@export var sound_list: Array[AudioStreamPlayer]

func play():
	var i = Global.rng.randi_range(0, sound_list.size()-1)
	sound_list[i].play()
