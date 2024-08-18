class_name HSliderExtended
extends HSlider

@export var value_label: Label
@export var actions: Array[BasicAction]

# Called when the node enters the scene tree for the first time.
func _ready():
	_value_changed(value)

func _value_changed(new_value):
	value_label.text = str(roundi(new_value))
	for action in actions:
		action.set_parameter([min_value,max_value,new_value])
		action.do_action(self)
