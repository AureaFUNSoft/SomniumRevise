class_name SignalTarget
extends BasicTarget

@export_group("Signal")
@export var signal_name: String

func set_target(target):
	super.set_target(target)
	var action_callable = Callable(current_behaviour, "do_action")
	target_object.connect(signal_name, action_callable)
