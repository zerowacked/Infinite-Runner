extends Node2D

@onready var pixel_length = 416

func despawn():
	queue_free()
