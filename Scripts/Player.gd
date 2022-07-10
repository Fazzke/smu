extends KinematicBody2D

const SPEED = 450
const GRAVITY = 2000
const UP = Vector2(0,-1)
const JUMP_SPEED = -1000
const JUMP_BOOST = 2
const CEILING_DOWN_BOOST = 3

var motion = Vector2()
export var world_limit = 2000

func _ready():
	Global.Player = self

func _physics_process(delta): #syncs to physics, makes constant delta
	update_motion(delta)

func _process(delta): #update every frame, as fast as frames can be
	update_animation(motion)

func update_motion(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)

	
func update_animation(motion):
	get_node("AnimatedSprite").update_child(motion)

func fall(delta):
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y += (GRAVITY * CEILING_DOWN_BOOST) * delta
	else:
		# motion.y will become very fast if we add it always, so we are only adding it while fall
		motion.y += GRAVITY * delta
#	if position.y > world_limit:
#		Global.GameState.end_game()
		
	motion.y = clamp(motion.y, (JUMP_SPEED * JUMP_BOOST), -JUMP_SPEED)   # fix for jump pad bug

func run():
	if Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_right"):
		motion.x = 0
	elif Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
	
func jump():
	if Input.is_action_pressed("ui_up") && is_on_floor():
		motion.y = JUMP_SPEED
#		Global.Jump_SFX.play()

		
func boost():
	motion.y = JUMP_SPEED * JUMP_BOOST
	
