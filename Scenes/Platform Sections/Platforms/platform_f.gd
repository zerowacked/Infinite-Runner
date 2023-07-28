extends Node2D

@onready var pixel_length = 528

func despawn():
	queue_free()
