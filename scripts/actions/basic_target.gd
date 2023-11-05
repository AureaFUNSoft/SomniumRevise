class_name BasicTarget
extends Resource

@export_group("Target")
@export var object_target: ObjectTarget

var target_object
var current_behaviour

func set_target(behaviour):
	target_object = behaviour
	current_behaviour = behaviour
	
	if object_target != null:
		target_object = object_target.get_target(target_object)
