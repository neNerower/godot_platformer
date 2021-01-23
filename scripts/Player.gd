extends KinematicBody2D

class_name Player

var speed_up = 50
var max_speed = 200
var jump_force = 600
var gravity = 30


var jumps_left
var motion = Vector2()

func _physics_process(delta):
	moving()
	jumping()
	gravity()
	animation()
	motion = move_and_slide(motion, Vector2.UP)
	
func moving():
	if Input.is_action_pressed("move_left"):
		motion.x -= speed_up
		motion.x = max(motion.x, -max_speed)
	elif Input.is_action_pressed("move_right"):
		motion.x += speed_up
		motion.x = min(motion.x, max_speed)
	else:
		motion.x = 0

	
func jumping():
	if is_on_floor(): #or next_to_wall():
		jumps_left = 2

	if Input.is_action_just_pressed("move_jump") and jumps_left > 0:
		if motion.y > 0: # IF WAS FALLING IGNORE FALLING MOTION
			motion.y = 0
		motion.y -= jump_force
		jumps_left -= 1
#		# ADD WALL JUMPING
#	
#	if Input.is_action_just_released("move_jump") and motion.y < 0:
#		motion.y = 0# START FALLING WHENE FINISHED move_jump 

func gravity():
	motion.y += gravity
	#if next_to_wall() and motion.y > 100:
	#	motion.y = 100
	
func animation():
	$PlayerSprite.play("walk")
	
	if motion.x < 0:
		$PlayerSprite.flip_h = true
	elif motion.x > 0:
		$PlayerSprite.flip_h = false
	else:
		$PlayerSprite.play("idle")
		
	if motion.y < 0:
		$PlayerSprite.play("jump")
	elif not is_on_floor():
		$PlayerSprite.play("fall")

# NEXT_TO_WALL FUNCTION USING RAYCAST2D
	
	
	
	
	
	
	
