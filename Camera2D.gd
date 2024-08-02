extends Camera2D
@export var player_path: NodePath
@onready var player = get_node(player_path)
const CAMERA_OFFSET = 400
@export var move_time = 1.0

func _process(delta):
	move_cam()
func _on_player_jumped():
	pass

func move_cam():
	var player_pos = round(abs(player.position.y))/100
	var tween_to = Vector2(0, player.position.y + CAMERA_OFFSET)
	var tween = get_tree().create_tween()
	tween.tween_property(self, "offset", tween_to, move_time)
	tween.EASE_IN_OUT

