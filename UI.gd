extends CanvasLayer
@export var player_path : NodePath

@onready var score = $Score
@onready var player = get_node(player_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_pos = round(abs(player.position.y))/100
	score.text = str(player_pos)
	# TODO: Need to make this so if the player is lower than the camera
	if player_pos <= 1:
		player.die()
