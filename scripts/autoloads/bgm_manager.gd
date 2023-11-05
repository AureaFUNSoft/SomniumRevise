extends Node

@export var bgm_player:AudioStreamPlayer

func change_bgm(bgm):
	# TODO: make change bgm seamless
	bgm_player.stream = bgm
	bgm_player.play()
