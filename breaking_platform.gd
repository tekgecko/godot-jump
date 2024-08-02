extends Area2D
@onready var sprite = $AnimatedSprite2D
@onready var break_audio = $BreakAudio

var broken = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	var player_pos = %Player.position.y
	# If platform is unbroken and player is higher than platform. Used 50 to tune value
	if !broken and (position.y - 50) <= player_pos:
		break_audio.play()
		sprite.play("default")
		broken = true
