class_name ResolutionList
extends OptionList

@export_group("Resolution List")
@export var resolution_scales:PackedFloat32Array

func get_list():
	var screen_resolution = DisplayServer.screen_get_size()
	
	for scale in resolution_scales:
		var reso = screen_resolution * scale
		var reso_note = "Native"
		if scale != 1:
			reso_note = "%sx" %var_to_str(scale)
		var reso_str = "%sx%s (%s)" %[reso.x, reso.y, reso_note]
		_list.append(reso_str)
	
	return _list

func get_default_index():
	_default_index = 1
	return _default_index

func select(index):
	var screen_resolution = DisplayServer.screen_get_size()
	DisplayServer.window_set_size(screen_resolution * resolution_scales[index])
	center_screen()

func center_screen():
	var screen_pos = DisplayServer.screen_get_position()
	var screen_size = DisplayServer.screen_get_size()
	var window_size = DisplayServer.window_get_size()
	var center_pos = screen_pos + ((screen_size - window_size) / 2)
	DisplayServer.window_set_position(center_pos)
