extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	exit()

func exit():
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()

