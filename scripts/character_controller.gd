extends CharacterBody3D

@export_category("Node Dependency")
@export var animation_tree:AnimationTree
@export var model_container:Node3D

@export_category("Locomotion Parameters")
@export var rotation_modifier:float

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		model_container.rotation.y = lerp_angle(model_container.rotation.y, input_dir.angle_to(Vector2.UP), rotation_modifier)
	
	velocity = model_container.quaternion * -animation_tree.get_root_motion_position() / delta
	
	animation_tree.set("parameters/conditions/run", input_dir != Vector2.ZERO)
	animation_tree.set("parameters/conditions/idle", input_dir == Vector2.ZERO)

	move_and_slide()
