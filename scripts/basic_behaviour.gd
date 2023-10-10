class_name BasicBehaviour
extends Node

@export_category("Target Item")
@export var node_target: Node
@export var signal_name: String = ""

@export_category("Action")
@export var actions: Array[BasicAction]

# Called when the node enters the scene tree for the first time.
func _ready():
	var target_node = get_parent()
	if node_target != null:
		target_node = node_target
	if !signal_name.is_empty():
		target_node.connect(signal_name,do_action)
	for action in actions:
		action.node = self

func do_action():
	for action in actions:
		action.do_action()
