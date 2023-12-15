extends AnimatedSprite2D

func _ready():
	play("jump")

func _on_animation_finished():
	queue_free()
