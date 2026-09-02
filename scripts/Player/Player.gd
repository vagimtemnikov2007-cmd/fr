extends CharacterBody3D
@export var speed:  float = 5.0
@export var jamp: float = 5.0

var gravity: float =  ProjectSettings.get_setting("physics/3d/default_gravity")

func  _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
	if  Input.is_action_just_pressed("jamp") and is_on_floor():
		velocity.y = jamp
	
	var input_dir: = Input.get_vector(
		"move_left",
		"move_right",
		"move_forward",
		"move_back",
	) 
	
	var direction := Vector3(input_dir.x, 0.0, input_dir.y).normalized()
	
	if direction != Vector3.ZERO:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		
	else:
		velocity.x = 0.0
		velocity.z = 0.0
		
	move_and_slide() 
