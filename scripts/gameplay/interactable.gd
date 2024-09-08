extends Area3D

@export_group("Nodes")
@export var toggled_visual: Node3D

@export_group("Action")
@export var action: BasicAction

var _is_player_inside: bool = false

func _ready() -> void:
	toggled_visual.hide()

func _input(event: InputEvent) -> void:
	if not _is_player_inside: return
	if Input.is_action_just_pressed("action"):
		print("Action %s interactable pressed" %name)
		if action != null:
			action.do_action(self)

func _on_player_entered(body: Node3D) -> void:
	if not body.is_in_group("Player"): return
	toggled_visual.show()
	_is_player_inside = true

func _on_player_exited(body: Node3D) -> void:
	if not body.is_in_group("Player"): return
	toggled_visual.hide()
	_is_player_inside = false
