extends Area2D

@onready var timer = $Timer

const SHOOT_SPEED = 20

func _ready():
	timer.start()

# Move bullet
func _process(delta):
	position.y -= SHOOT_SPEED

func _on_timer_timeout():
	self.queue_free()


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group("enemy"):
		self.queue_free()
		area.die()
