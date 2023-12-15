extends AnimatedSprite2D

func _ready():
	play("land")

func _on_animation_finished():
	queue_free()
