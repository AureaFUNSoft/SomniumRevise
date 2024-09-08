class_name CameraController
extends Node3D

@export var mouse_speed:Vector2
@export var move_margin:Vector2


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if CustomInput.get_mouse_state(): return
		var move = event.screen_velocity
		if move.x > 0:
			move.x = max(0, move.x - move_margin.x)
		elif move.x < 0:
			move.x = min(0, move.x + move_margin.x)
		if abs(move.x) > move_margin.x:
			var x_speed = move.x * -mouse_speed.x * get_process_delta_time()
			x_speed /= Vector2(DisplayServer.screen_get_size()).x
			rotate_y(x_speed)
