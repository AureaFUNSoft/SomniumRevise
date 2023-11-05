class_name NodeObjectTarget
extends ObjectTarget

@export_group("Target Node")
@export var target_node: NodePath

func get_target(target):
	var node_t = target.get_node(target_node)
	if node_t != null:
		return node_t
	return target
