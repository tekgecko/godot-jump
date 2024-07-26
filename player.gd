extends CharacterBody2D

@onready var GRAVITY = 50
@onready var UP = Vector2.UP
@onready var jump_height = -2000
@onready var motion = Vector2(0,0)
@onready var SPEED = 500
@onready var sprite = $AnimatedSprite2D
@onready var jump_audio = $JumpAudio
@onready var fall_audio = $FallAudio

@onready var alive = true
@onready var DEATH_SPEED = 800
@onready var col_shape = $CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_velocity(Vector2(0,GRAVITY))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide()
	if alive:
		controls()
		jump()
		set_velocity(motion)
		apply_gravity()
	elif !alive:
		set_velocity(Vector2(0,2000))
		col_shape.disabled = true
		

func jump():
	if is_on_floor():
		motion.y = GRAVITY
		motion.y += jump_height
		sprite.play("jump")
		jump_audio.play()
		
	
func controls():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
		sprite.flip_h = true
	if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
		sprite.flip_h = false
	if Input.is_action_just_released("left") or Input.is_action_just_released("right"):
		motion.x = 0

func apply_gravity():
	motion.y += GRAVITY

func die():
	alive = false
	fall_audio.play()
	print("You dead!")
