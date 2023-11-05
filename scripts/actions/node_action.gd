class_name NodeAction
extends BasicAction

@export_group("Action")
@export var node_action: NodePath
@export var method_name: String

func do_action(behaviour, parameters = {}):
	super.do_action(behaviour)
	
	var a_node = behaviour.get_node(node_action)
	if a_node != null:
		node = a_node
	
	if node != null:
		node.call(method_name)
	
