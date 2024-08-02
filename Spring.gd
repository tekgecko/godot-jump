extends Area2D

signal spring_hit

@onready var spring_audio = $SpringAudio
@onready var spring = $AnimatedSprite2D

var sprung = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if !sprung:
		spring_audio.play()
		spring.play("default")
		emit_signal("spring_hit")
		
