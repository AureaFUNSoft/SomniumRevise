class_name BasicAction
extends Resource

var node = null
var parameters

func set_parameter(value):
	parameters = value

func do_action(behaviour):
	node = behaviour
	# TODO: change this to abstract method when it's available on gdscript
