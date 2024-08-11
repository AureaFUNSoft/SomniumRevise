extends Node

enum MouseModeTypes {
	SCENE = 0,
	UI = 1,
	CONTROL = 2,
}

var _mouse_modes = [false, false, false]

func is_action_just_pressed(action):
	if get_mouse_state(): return false
	return Input.is_action_just_pressed(action)

func get_vector(negative_x, positive_x, negative_y, positive_y):
	if get_mouse_state(): return Vector2.ZERO
	return Input.get_vector(negative_x, positive_x, negative_y, positive_y)

func set_mouse_mode(type: MouseModeTypes, state: bool):
	_mouse_modes[type] = state
	update_mouse_mode()

func update_mouse_mode():
	Input.mouse_mode = 0 if get_mouse_state() else 2

func get_mouse_state():
	for mode in _mouse_modes:
		if mode: return true
	return false
