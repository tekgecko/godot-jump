extends CharacterBody2D

signal jumped

@onready var GRAVITY = 50
@onready var UP = Vector2.UP
@onready var jump_height = -2000
@onready var motion = Vector2(0,0)
@onready var SPEED = 500
@onready var sprite = $AnimatedSprite2D
@onready var jump_audio = $JumpAudio
@onready var fall_audio = $FallAudio
@onready var shoot_audio = $ShootAudio
@onready var alive = true
@onready var DEATH_SPEED = 800
@onready var col_shape = $CollisionShape2D
@onready var projectile = preload("res://projectile.tscn")
@onready var death_timer = $DeathTimer

const DEATH_HEIGHT = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	set_velocity(Vector2(0,GRAVITY))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide()
	#check_height()
	if alive:
		if is_on_floor():
			jump()
		controls()
		set_velocity(motion)
		apply_gravity()
	elif !alive:
		set_velocity(Vector2(0,2000))
		col_shape.disabled = true

func check_height():
	if position.y <= DEATH_HEIGHT:
		die()

func jump():
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
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if Input.is_action_just_released("shoot"):
		pass
	

func apply_gravity():
	motion.y += GRAVITY

func die():
	alive = false
	if !fall_audio.playing:
		fall_audio.play()
	death_timer.start()
		
func shoot():
	var bullet = projectile.instantiate()
	get_tree().root.get_child(0).add_child(bullet)
	bullet.position = position
	sprite.play("shoot")
	shoot_audio.play()

	

# Reload game on death timeout
func _on_death_timer_timeout():
	get_tree().reload_current_scene()
