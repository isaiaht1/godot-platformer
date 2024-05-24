extends CharacterBody2D

var can_move=true 


const max_velocity_x=200
const acceleration=5
const JUMP_VELOCITY = -225.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += (gravity/2) * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction and (velocity.x==0 or get_direction(velocity.x)==direction):
		if abs(velocity.x)<max_velocity_x:
			velocity.x += direction * acceleration
			if can_move:
				$sprte.play("run")
	elif direction and (velocity.x==0 or get_direction(velocity.x)!=direction):
		velocity.x = move_toward(velocity.x, 0, acceleration*max_velocity_x/75)
		if can_move:
			$sprte.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration*max_velocity_x/75)
		$sprte.play("idle")
	if not is_on_floor():
		$sprte.play("jump")
	if can_move:
		move_and_slide()
	else:
		$sprte.play("idle")
		
func get_direction(i):
	if i<0:
		$sprte.flip_h=true
		return -1;
	elif i>0:
		$sprte.flip_h=false
		return 1;
	else:
		print("err")
		return 0;


