class_name ButtonGroupManager
extends Node

signal button_pressed_index(index)

@export_group("Manager")
@export var button_group: ButtonGroup

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Button Group Manager -> %s" %button_group.get_buttons().size())
	
	var action_callable = Callable(self, "button_pressed")
	button_group.connect("pressed", action_callable)

func button_pressed(button):
	print("Pressed %s button" %button.name)
	emit_signal("button_pressed_index", button.get_index())
