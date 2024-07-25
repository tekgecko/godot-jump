extends CharacterBody2D

@onready var GRAVITY = 50
@onready var UP = Vector2.UP
@onready var jump_height = -2000
@onready var motion = Vector2(0,0)
@onready var SPEED = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	set_velocity(Vector2(0,GRAVITY))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	apply_gravity()
	move_and_slide()
	controls()
	jump()
	set_velocity(motion)

func jump():
	if is_on_floor():
		motion.y = GRAVITY
		print("on floor")
		motion.y += jump_height
	
func controls():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	if Input.is_action_just_released("left") or Input.is_action_just_released("right"):
		motion.x = 0
	

func apply_gravity():
	motion.y += GRAVITY
