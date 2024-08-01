extends Camera2D
@export var player_path: NodePath
@onready var player = get_node(player_path)
const CAMERA_OFFSET = 400

func _process(delta):
	# TODO: Get the players last frame and move back
	var player_pos = round(abs(player.position.y))/100
	
func _on_player_jumped():
	var player_pos = round(abs(player.position.y))/100
	# TODO: Tween animation here
		
	var tween = get_tree().create_tween()
	tween.tween_property(self, "offset", Vector2(0, player.position.y + CAMERA_OFFSET), 2)
	
