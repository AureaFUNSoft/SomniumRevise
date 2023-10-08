class_name BasicBehaviour
extends Node

@export_category("Target Item")
@export var node_target: Node
@export var signal_name: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	var target_node = get_parent()
	if node_target != null:
		target_node = node_target
	if !signal_name.is_empty():
		target_node.connect(signal_name,do_action)

func do_action():
	var child0 = get_child(0)
	if child0 is BasicAction:
		child0.do_action()
