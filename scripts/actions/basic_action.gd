class_name BasicAction
extends Resource

var node = null

func do_action(behaviour, parameters = null):
	node = behaviour
	# TODO: change this to abstract method when it's available on gdscript
