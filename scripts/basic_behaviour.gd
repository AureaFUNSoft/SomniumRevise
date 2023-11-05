class_name BasicBehaviour
extends Node

@export_group("Target")
@export var target: BasicTarget

@export_group("Action")
@export var action: BasicAction


# Called when the node enters the scene tree for the first time.
func _ready():
	if target != null:
		target.set_target(self)

func do_action():
	print("do action")
	if action != null:
		action.do_action(self)
