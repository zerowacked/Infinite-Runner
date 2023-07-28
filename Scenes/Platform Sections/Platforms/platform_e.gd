extends Node2D

@onready var pixel_length = 256

func despawn():
	queue_free()
