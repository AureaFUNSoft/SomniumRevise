class_name ChangeAudioVolumeAction
extends BasicAction

@export var bus_name:String

func do_action(behaviour):
	super.do_action(behaviour)
	var bus_idx = AudioServer.get_bus_index(bus_name)
	var value_range = parameters[1] - parameters[0]
	var value = parameters[2] - parameters[0]
	var volume_db = linear_to_db(value/value_range)
	AudioServer.set_bus_volume_db(bus_idx,volume_db)
