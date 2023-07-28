extends Node2D

@onready var pixel_length = 592

func despawn():
	queue_free()
