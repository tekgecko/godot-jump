extends StaticBody2D

@export var movement_speed = 5
@export var movement_amount = 20

@onready var screen_width = get_viewport_rect().size.x
@onready var camera = %Camera2D
@onready var extent_left = Vector2(camera.position.x - (screen_width / 2), position.y)
@onready var extent_right = Vector2(camera.position.x + (screen_width / 2),position.y)

func _ready():
	
	# Sets a random start pos
	var start = (randi_range(0,1))
	if start == 0:
		position.x = extent_right.x
		var tween = create_tween().tween_property(self, "position", extent_left, movement_speed)
	else:
		position.x = extent_left.x
		var tween = create_tween().tween_property(self, "position", extent_right, movement_speed)

func _process(delta):
	pass
