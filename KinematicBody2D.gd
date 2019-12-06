# Player Script
extends KinematicBody2D

# Constant Variables
const UP = Vector2(0, -1)
const GRAV = 20
const ACCELERATION = 50
const MAX_SPEED = 225
const  JUMP_HEIGHT = -550

# X and Y movement
var motion = Vector2()
var tran = transform


func _physics_process(delta):
	motion.y += GRAV
	var friction = false
	
	# Movement to the right
	if Input.is_action_pressed("ui_right"):
		# Setting a limit on speed
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		# Running Animation
		$Sprite.flip_h = false
		$Sprite.play("Run")
	# Movement to the left
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		# Running Animation
		$Sprite.flip_h = true
		$Sprite.play("Run")
	# Movement if no button is pressed
	else:
		# Idle Animation
		$Sprite.play("Idle")
		# Smoothing and friction
		friction = true
	
	# Checks if player is touching the floor
	if is_on_floor():
		# Movement for jumping
		jump()
		# If friction is true (Line 35), lerp to smooth movement and simulate friction 
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.4)
	# If player is not in the ground
	else:
		# Plays Jump Animation
		if motion.y < 0:
			$Sprite.play("Jump")
		# Plays Fall Animation
		if motion.y > 0:
			$Sprite.play("Fall")
		# Less friction when in air
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	
	# Check if player falls to restart level
	#if tran.y < 40:
	#	get_tree().change_scene("World.tscn")
	
	# Function needed to apply movement (motion = left/right, UP = up)
	motion = move_and_slide(motion, UP)


func jump():
	if Input.is_action_pressed("ui_up"):
		motion.y = JUMP_HEIGHT





























