extends Camera2D
@export var player_path: NodePath
@onready var player = get_node(player_path)
const CAMERA_OFFSET = 400

func _process(delta):
	# TODO: Get the players last frame and move back
	offset.y = player.position.y + CAMERA_OFFSET

func _on_player_jumped():
	var player_pos = round(abs(player.position.y))/100
