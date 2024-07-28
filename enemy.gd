extends Area2D

@onready var mon_hit_audio = $MonHitAudio

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# If a physics body in the player group intersects, call tje die method on that object.
func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("Entered")
	if body.is_in_group("player"):
		get_tree().call_group("player", "die")
		mon_hit_audio.play()
	elif body.is_in_group("projectile"):
		print("Emeny has been hit")
		queue_free()


