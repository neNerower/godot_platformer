extends KinematicBody2D

const GRAVITY = 30
const SPEED = 100

var direction = 1
var motion = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	motion.x = SPEED * direction
	
	$EnemySprite.play("walk")
	motion.y += GRAVITY
	motion = move_and_slide(motion, Vector2.UP)
	
	if is_on_wall():
		direction = -1 * direction
		$EnemySprite.flip_h = not $EnemySprite.flip_h
		$EnemyRayCast.position.x *= -1
		
	if not $EnemyRayCast.is_colliding():
		direction = -1 * direction
		$EnemySprite.flip_h = not $EnemySprite.flip_h
		$EnemyRayCast.position.x *= -1
