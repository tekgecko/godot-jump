extends StaticBody2D

@export var movement_speed = 5
@export var movement_amount = 20

@onready var screen_width = get_viewport_rect().size.x
@onready var camera = %Camera2D
@onready var extent_left = Vector2(camera.position.x - (screen_width / 2), position.y)
@onready var extent_right = Vector2(camera.position.x + (screen_width / 2),position.y)

func _ready():
	# Sets a random start pos
	var tween = create_tween()
	var start = (randi_range(0,1))
	if start == 0:
		position.x = extent_right.x
		tween.tween_property(self, "position", extent_left, movement_speed)
		tween.tween_property(self, "position", extent_right, movement_speed)
		tween.set_loops(0)
	else:
		position.x = extent_left.x
		tween.tween_property(self, "position", extent_right, movement_speed)
		tween.tween_property(self, "position", extent_left, movement_speed)
		tween.set_loops(0)
		
func _process(delta):
	pass
