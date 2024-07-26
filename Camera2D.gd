extends Camera2D
@export var player_path: NodePath
@onready var player = get_node(player_path)
@onready var CAMERA_OFFSET = -600

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	offset.y = player.position.y + CAMERA_OFFSET
