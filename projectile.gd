extends StaticBody2D
@onready var timer = $Timer

const SHOOT_SPEED = 30
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= SHOOT_SPEED
 
func _on_timer_timeout():
	print("done")
	self.queue_free()
