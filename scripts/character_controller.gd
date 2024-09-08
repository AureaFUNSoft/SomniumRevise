extends CharacterBody3D

@export_category("Node Dependency")
@export var animation_tree:AnimationTree
@export var camera_controller:CameraController
@export var model_container:Node3D

@export_category("Locomotion Parameters")
@export var rotation_modifier:float
@export var combat_idle_time:float

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var combat_mode = false
var combat_idle_timer = 0

func _ready():
	var action_callable = Callable(self, "_move_to_spawn_pos")
	Gameplay.connect("change_map_completed",action_callable)

func _move_to_spawn_pos():
	var spawn_point = Gameplay.get_spawn_pos_node()
	position = spawn_point.position
	model_container.rotation.y = spawn_point.rotation.y
	camera_controller.rotation.y = spawn_point.rotation.y
	var spawners = get_tree().get_nodes_in_group("SpawnPoint")

func _input(_event):
	if Input.is_action_just_pressed("mouse_mode"):
		CustomInput.set_mouse_mode(CustomInput.MouseModeTypes.CONTROL, true)
	if Input.is_action_just_released("mouse_mode"):
		CustomInput.set_mouse_mode(CustomInput.MouseModeTypes.CONTROL, false)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if CustomInput.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if combat_idle_timer > 0:
		combat_idle_timer -= delta
	
	if combat_idle_timer < 0:
		combat_idle_timer = 0
		combat_mode = false
	
	var rotation_transform = transform
	if camera_controller != null:
		rotation_transform = camera_controller.transform
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = CustomInput.get_vector("left", "right", "forward", "backward")
	var direction = (rotation_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var attack = CustomInput.is_action_just_pressed("attack")
	if attack:
		combat_mode = true
		combat_idle_timer = combat_idle_time
	
	if direction:
		var norm_dir = Vector2(direction.x, direction.z)
		model_container.rotation.y = lerp_angle(model_container.rotation.y, norm_dir.angle_to(Vector2.UP), rotation_modifier)
	
	velocity = model_container.quaternion * -animation_tree.get_root_motion_position() / delta
	
	animation_tree.set("parameters/conditions/run", input_dir != Vector2.ZERO)
	animation_tree.set("parameters/conditions/idle", input_dir == Vector2.ZERO)
	animation_tree.set("parameters/conditions/attack", attack)
	animation_tree.set("parameters/conditions/peace", !combat_mode)

	move_and_slide()
