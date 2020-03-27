extends KinematicBody2D

# Declare member variables here. Examples:
var vel = Vector2()
var is_jumping = false
# Constants
var GRAVITY = 5
var SPEED = 10
var MAX_VEL_X = 200
var FRICTION = 5
var JUMP_POWER = 200
var DEATH_PTS = 200
# Level 1
var LV1_RESET = Vector2(900, 360)
# Nodes
onready var TileMap = get_node("../TileMap")


# Called when the node enters the scene tree for the first time.
func _ready():
	position = LV1_RESET
	print(get_node("../TileMap"))

func move():
	# Detect left or right key press
	if Input.is_key_pressed(KEY_LEFT):
		vel.x -= SPEED
	elif Input.is_key_pressed(KEY_RIGHT):
		vel.x += SPEED
	else:
		# Friction on the ground
		if vel.x > 0:
			vel.x -= FRICTION
		elif vel.x < 0:
			vel.x += FRICTION
	# Max speed
	if vel.x > MAX_VEL_X:
		vel.x = MAX_VEL_X
	elif vel.x < -MAX_VEL_X:
		vel.x = -MAX_VEL_X
		
func jump():
	# On the ground  
	if not is_jumping and int(vel.y) == 0 and Input.is_key_pressed(KEY_UP):
		vel.y -= JUMP_POWER
		is_jumping = true

func fall():
	# Falling velocity
	vel.y += GRAVITY
	# Falling toward ground
	if is_jumping and vel.y > 0:
		is_jumping = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move()
	jump()
	fall()
	vel = move_and_slide(vel)

func _on_Death_body_entered(body):
	position = LV1_RESET
	get_parent().get_parent().score -= DEATH_PTS
