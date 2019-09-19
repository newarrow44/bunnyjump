extends KinematicBody2D

var motion = Vector2(0,100)
export var gravity = 30
export var SPEED = 300
export var jump = 700

func _physics_process(delta):
	
	move_and_slide(motion, Vector2(0, -1 ))
	apply_gravity()
	walk()
	jump()
	
func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y = motion.y + gravity
	
func jump():
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -jump
	
func walk():
	if Input.is_action_pressed("left"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right"):
		motion.x = +SPEED
	else:
		motion.x = 0